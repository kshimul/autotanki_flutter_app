import 'dart:async';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/ble_service.dart';
import '../data/device_repository.dart';
import 'provisioning_state.dart';

// ─────────────────────────────────────────────────────────────────────────────
// PROVISIONING NOTIFIER — Orchestrates the full 5-step wizard
// QR → BLE Scan → BLE Connect → WiFi Send → Claim API → Complete
// ─────────────────────────────────────────────────────────────────────────────

class ProvisioningNotifier extends StateNotifier<ProvisioningState> {
  final BleProvisioningService _ble;
  final DeviceRepository _deviceRepo;

  // Extracted from QR payload (kept in memory only, never persisted)
  String? _claimCode;
  String? _secretKey;

  StreamSubscription? _scanSub;

  ProvisioningNotifier(this._ble, this._deviceRepo)
      : super(const ProvisioningState.idle());

  // ── Step 1: QR Code scanned ───────────────────────────────────────────────
  /// QR payload expected format: "CLAIM:{claimCode}:SECRET:{secretKey}"
  void onQrCodeScanned(String rawValue) {
    try {
      final parts = rawValue.split(':');
      // Format: CLAIM:{code}:SECRET:{key}
      if (parts.length >= 4 && parts[0] == 'CLAIM' && parts[2] == 'SECRET') {
        _claimCode = parts[1];
        _secretKey = parts[3];
        state = ProvisioningState.qrScanned(claimCode: _claimCode!);
      } else {
        state = const ProvisioningState.error(
          message: 'QR code is invalid. Please use the SmartTank QR from your device.',
          failedStep: ProvisioningStep.qrScan,
        );
      }
    } catch (e) {
      state = const ProvisioningState.error(
        message: 'Could not read QR code. Try again.',
        failedStep: ProvisioningStep.qrScan,
      );
    }
  }

  // ── Step 2a: Start BLE scan ───────────────────────────────────────────────
  void startBleScan() {
    state = const ProvisioningState.bleScanning();
    _scanSub?.cancel();

    _scanSub = _ble.scanForDevices().listen(
      (result) {
        // First matching SmartTank device found
        final isScanning = state.maybeWhen(
          bleScanning: () => true,
          orElse: () => false,
        );
        if (isScanning) {
          state = ProvisioningState.bleFound(
            deviceId: result.device.remoteId.str,
            deviceName: result.advertisementData.localName.isNotEmpty
                ? result.advertisementData.localName
                : 'SmartTank Device',
          );
          _scanSub?.cancel(); // Stop scan once found
        }
      },
      onError: (_) {
        state = const ProvisioningState.error(
          message: 'BLE scan failed. Check Bluetooth permissions.',
          failedStep: ProvisioningStep.bleConnect,
        );
      },
    );
  }

  // ── Step 2b: Connect to BLE device ────────────────────────────────────────
  Future<void> connectToBleDevice(BluetoothDevice device) async {
    try {
      await _ble.connect(device);

      // Immediately send secret key over BLE (never via API)
      if (_secretKey != null) {
        await _ble.writeSecretKey(_secretKey!);
        _secretKey = null; // Clear from memory once sent
      }

      state = ProvisioningState.bleConnected(
        deviceId: device.remoteId.str,
      );
    } catch (e) {
      state = ProvisioningState.error(
        message: 'BLE connection failed: ${e.toString()}',
        failedStep: ProvisioningStep.bleConnect,
      );
    }
  }

  // ── Step 3: Proceed to WiFi setup ─────────────────────────────────────────
  void proceedToWifiSetup(String bleDeviceId) {
    if (_claimCode == null) {
      state = const ProvisioningState.error(
        message: 'Session expired. Please scan the QR code again.',
        failedStep: ProvisioningStep.wifiSend,
      );
      return;
    }
    state = ProvisioningState.awaitingWifi(
      bleDeviceId: bleDeviceId,
      claimCode: _claimCode!,
    );
  }

  // ── Step 3→4: Send WiFi credentials via BLE ───────────────────────────────
  Future<void> sendWifiCredentials({
    required String ssid,
    required String password,
  }) async {
    state = const ProvisioningState.sendingWifi();
    try {
      await _ble.writeWifiCredentials(ssid: ssid, password: password);
      await _ble.waitForWifiConfirmation(
        timeout: const Duration(seconds: 60),
      );
      // WiFi confirmed by firmware — now claim device via API
      state = ProvisioningState.claimingDevice(claimCode: _claimCode!);
      await _claimDeviceViaApi();
    } catch (e) {
      state = ProvisioningState.error(
        message: e.toString().contains('WiFi')
            ? 'Device could not connect to WiFi. Check credentials.'
            : 'WiFi setup timed out. Ensure the device is nearby.',
        failedStep: ProvisioningStep.wifiSend,
      );
    }
  }

  // ── Step 4: Claim via API ──────────────────────────────────────────────────
  Future<void> _claimDeviceViaApi() async {
    try {
      final device = await _deviceRepo.claimDevice(_claimCode!);
      _claimCode = null; // Clear from memory once claimed
      await _ble.disconnect(); // Clean BLE teardown
      state = ProvisioningState.complete(
        deviceId: device.id,
        deviceName: device.name,
      );
    } catch (e) {
      state = const ProvisioningState.error(
        message: 'Device claim failed. Check your internet connection.',
        failedStep: ProvisioningStep.claim,
      );
    }
  }

  // ── Reset wizard ──────────────────────────────────────────────────────────
  void reset() {
    _claimCode = null;
    _secretKey = null;
    _scanSub?.cancel();
    _ble.disconnect();
    state = const ProvisioningState.idle();
  }

  @override
  void dispose() {
    _scanSub?.cancel();
    _ble.disconnect();
    super.dispose();
  }
}

final provisioningNotifierProvider =
    StateNotifierProvider.autoDispose<ProvisioningNotifier, ProvisioningState>(
  (ref) => ProvisioningNotifier(
    ref.watch(bleProvisioningServiceProvider),
    ref.watch(deviceRepositoryProvider),
  ),
);
