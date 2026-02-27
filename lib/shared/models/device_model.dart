import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_model.freezed.dart';
part 'device_model.g.dart';

@freezed
class Device with _$Device {
  const factory Device({
    required String id,
    required String name,
    required String claimCode,
    String? macAddress,
    // API-verified fields from Swagger (were missing in v3.0)
    String? tankTypeId,          // UUID linking to predefined tank type
    @Default(false) bool isLabelPrinted,
    required String ownerId,
    required String status,      // 'ONLINE' | 'OFFLINE' | 'SUSPENDED'
    DateTime? lastSeenAt,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Device;

  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);
}

// Motor control — Swagger-verified: motor = "oht" | "ugt", action = "ON" | "OFF"
@freezed
class MotorControlRequest with _$MotorControlRequest {
  const factory MotorControlRequest({
    required String action, // "ON" | "OFF"
  }) = _MotorControlRequest;

  factory MotorControlRequest.fromJson(Map<String, dynamic> json) =>
      _$MotorControlRequestFromJson(json);
}

// Claim device — Swagger-verified: only claimCode required (secretKey is BLE-only)
@freezed
class ClaimDeviceRequest with _$ClaimDeviceRequest {
  const factory ClaimDeviceRequest({
    required String claimCode,
    // secretKey is NOT sent to API — goes from app to firmware via BLE
  }) = _ClaimDeviceRequest;

  factory ClaimDeviceRequest.fromJson(Map<String, dynamic> json) =>
      _$ClaimDeviceRequestFromJson(json);
}
