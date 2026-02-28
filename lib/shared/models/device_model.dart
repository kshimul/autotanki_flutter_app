import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_model.freezed.dart';
part 'device_model.g.dart';

@freezed
class Device with _$Device {
  const Device._();

  const factory Device({
    required String id,
    String? nickname,
    String? claimCode,
    String? macAddress,
    String? tankTypeId,
    @Default(false) bool isLabelPrinted,
    String? ownerId,
    String? status,
    String? lastSeenAt,
    String? createdAt,
    String? updatedAt,
    bool? suspended,
    bool? isOnline,
    int? wifiSignal,
    double? ohtWaterLevel,
    double? ugtWaterLevel,
    bool? ohtEnabled,
    String? ohtMode,
    String? ohtState,
    bool? ugtEnabled,
    Map<String, dynamic>? oht,
    Map<String, dynamic>? ugt,
    Map<String, dynamic>? subscription,
  }) = _Device;

  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);

  String get displayName => nickname ?? macAddress ?? 'SmartTank';
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

// Claim device — Swagger-verified: requires claimCode, macAddress, and signature
@freezed
class ClaimDeviceRequest with _$ClaimDeviceRequest {
  const factory ClaimDeviceRequest({
    required String claimCode,
    required String macAddress,
    required String signature,
  }) = _ClaimDeviceRequest;

  factory ClaimDeviceRequest.fromJson(Map<String, dynamic> json) =>
      _$ClaimDeviceRequestFromJson(json);
}
