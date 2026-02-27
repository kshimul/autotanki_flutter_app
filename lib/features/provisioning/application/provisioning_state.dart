import 'package:freezed_annotation/freezed_annotation.dart';

part 'provisioning_state.freezed.dart';

// ─────────────────────────────────────────────────────────────────────────────
// PROVISIONING STATE — sealed union drives 5-step wizard UI
// ─────────────────────────────────────────────────────────────────────────────

@freezed
class ProvisioningState with _$ProvisioningState {
  // Step 1: Waiting for QR scan
  const factory ProvisioningState.idle() = _Idle;

  // Step 1→2: QR scanned, claim code extracted
  const factory ProvisioningState.qrScanned({
    required String claimCode,
  }) = _QrScanned;

  // Step 2: Scanning for BLE device
  const factory ProvisioningState.bleScanning() = _BleScanning;

  // Step 2: BLE device found, ready to connect
  const factory ProvisioningState.bleFound({
    required String deviceId,
    required String deviceName,
  }) = _BleFound;

  // Step 2→3: BLE connected, sending secret key
  const factory ProvisioningState.bleConnected({
    required String deviceId,
  }) = _BleConnected;

  // Step 3: Waiting for WiFi credentials from user
  const factory ProvisioningState.awaitingWifi({
    required String bleDeviceId,
    required String claimCode,
  }) = _AwaitingWifi;

  // Step 3→4: Sending WiFi credentials via BLE
  const factory ProvisioningState.sendingWifi() = _SendingWifi;

  // Step 4: WiFi confirmed by firmware, claiming device via API
  const factory ProvisioningState.claimingDevice({
    required String claimCode,
  }) = _ClaimingDevice;

  // Step 5: Provisioning complete
  const factory ProvisioningState.complete({
    required String deviceId,
    required String deviceName,
  }) = _Complete;

  // Error (any step)
  const factory ProvisioningState.error({
    required String message,
    required ProvisioningStep failedStep,
  }) = _ProvisioningError;
}

enum ProvisioningStep {
  qrScan,
  bleConnect,
  wifiSend,
  claim,
  finalizing,
}
