import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_config_model.freezed.dart';
part 'device_config_model.g.dart';

// Tank config — API-verified: includes predefSizeId (was missing in v3.0)
@freezed
class TankConfig with _$TankConfig {
  const factory TankConfig({
    required String deviceId,
    String? predefSizeId,          // Predefined tank size option — API-verified
    double? ohtCapacityLiters,
    double? ugtCapacityLiters,
    double? ohtLowThreshold,       // % — triggers low level alert
    double? ugtLowThreshold,
    double? ohtHighThreshold,      // % — triggers stop pumping
    double? ugtHighThreshold,
  }) = _TankConfig;

  factory TankConfig.fromJson(Map<String, dynamic> json) =>
      _$TankConfigFromJson(json);
}

// Device share — permissionLevel controls what shared user can do
@freezed
class DeviceShare with _$DeviceShare {
  const factory DeviceShare({
    required String id,
    required String deviceId,
    required String sharedWithUserId,
    required String sharedWithEmail,
    required String permissionLevel, // 'VIEW' | 'CONTROL' | 'ADMIN'
    required DateTime createdAt,
  }) = _DeviceShare;

  factory DeviceShare.fromJson(Map<String, dynamic> json) =>
      _$DeviceShareFromJson(json);
}

@freezed
class CreateShareRequest with _$CreateShareRequest {
  const factory CreateShareRequest({
    required String email,
    required String permissionLevel,
  }) = _CreateShareRequest;

  factory CreateShareRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateShareRequestFromJson(json);
}
