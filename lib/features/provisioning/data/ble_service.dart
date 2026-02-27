import 'dart:async';
import 'dart:convert';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ─────────────────────────────────────────────────────────────────────────────
// BLE SERVICE
// Handles BLE scanning, connecting, and writing WiFi credentials + secret key
// to the firmware's characteristic.
//
// SECURITY NOTE:
// secretKey NEVER goes to the API — only sent device-to-firmware via BLE.
// WiFi password also goes only via BLE (never logged, never stored).
// ─────────────────────────────────────────────────────────────────────────────

// Firmware-defined GATT identifiers (must match firmware source)
const _kServiceUuid        = '12345678-1234-5678-1234-56789abcdef0';
const _kSecretKeyCharUuid  = '12345678-1234-5678-1234-56789abcdef1';
const _kWifiCharUuid       = '12345678-1234-5678-1234-56789abcdef2';
const _kStatusCharUuid     = '12345678-1234-5678-1234-56789abcdef3';

class BleProvisioningService {
  BluetoothDevice? _connectedDevice;
  StreamSubscription? _scanSub;
  StreamSubscription? _statusSub;

  // ── Scan for SmartTank devices ─────────────────────────────────────────────
  /// Returns stream of discovered devices filtered by SmartTank service UUID.
  Stream<ScanResult> scanForDevices() {
    FlutterBluePlus.startScan(
      withServices: [Guid(_kServiceUuid)],
      timeout: const Duration(seconds: 30),
    );
    return FlutterBluePlus.scanResults
        .expand((results) => results)
        .where((r) => r.advertisementData.serviceUuids
            .contains(Guid(_kServiceUuid)));
  }

  Future<void> stopScan() => FlutterBluePlus.stopScan();

  // ── Connect ────────────────────────────────────────────────────────────────
  Future<void> connect(BluetoothDevice device) async {
    await device.connect(timeout: const Duration(seconds: 15));
    _connectedDevice = device;
  }

  // ── Write secret key ───────────────────────────────────────────────────────
  /// Sends secretKey from QR code payload to the firmware via BLE.
  /// secretKey is used by firmware to verify the provisioner is authentic.
  Future<void> writeSecretKey(String secretKey) async {
    final char = await _findCharacteristic(_kSecretKeyCharUuid);
    await char.write(utf8.encode(secretKey), withoutResponse: false);
  }

  // ── Write WiFi credentials ─────────────────────────────────────────────────
  /// WiFi credentials are encoded as JSON and written to the WiFi characteristic.
  /// They travel only over BLE — never sent to the API.
  Future<void> writeWifiCredentials({
    required String ssid,
    required String password,
  }) async {
    final char = await _findCharacteristic(_kWifiCharUuid);
    final payload = jsonEncode({'ssid': ssid, 'password': password});
    await char.write(utf8.encode(payload), withoutResponse: false);
  }

  // ── Listen for firmware status ─────────────────────────────────────────────
  /// Returns a future that resolves when firmware reports 'WIFI_CONNECTED'
  /// or throws on 'WIFI_FAILED' after [timeout].
  Future<void> waitForWifiConfirmation({
    Duration timeout = const Duration(seconds: 60),
  }) async {
    final char = await _findCharacteristic(_kStatusCharUuid);
    await char.setNotifyValue(true);

    final completer = Completer<void>();

    _statusSub = char.lastValueStream.listen((bytes) {
      final status = utf8.decode(bytes);
      if (status == 'WIFI_CONNECTED') {
        if (!completer.isCompleted) completer.complete();
      } else if (status == 'WIFI_FAILED') {
        if (!completer.isCompleted) {
          completer.completeError(Exception('WiFi connection failed on device'));
        }
      }
    });

    try {
      await completer.future.timeout(timeout);
    } finally {
      await _statusSub?.cancel();
      _statusSub = null;
    }
  }

  // ── Disconnect ─────────────────────────────────────────────────────────────
  Future<void> disconnect() async {
    await _statusSub?.cancel();
    _statusSub = null;
    await _scanSub?.cancel();
    _scanSub = null;
    try {
      await _connectedDevice?.disconnect();
    } catch (_) {}
    _connectedDevice = null;
  }

  // ── Find characteristic helper ─────────────────────────────────────────────
  Future<BluetoothCharacteristic> _findCharacteristic(String uuid) async {
    final device = _connectedDevice;
    if (device == null) {
      throw StateError('No BLE device connected');
    }
    final services = await device.discoverServices();
    for (final service in services) {
      if (service.uuid == Guid(_kServiceUuid)) {
        for (final char in service.characteristics) {
          if (char.uuid == Guid(uuid)) return char;
        }
      }
    }
    throw StateError('Characteristic $uuid not found on device');
  }
}

final bleProvisioningServiceProvider = Provider<BleProvisioningService>((ref) {
  final service = BleProvisioningService();
  ref.onDispose(service.disconnect);
  return service;
});
