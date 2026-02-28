import 'package:freezed_annotation/freezed_annotation.dart';

part 'telemetry_model.freezed.dart';
part 'telemetry_model.g.dart';

// Live telemetry from MQTT — parsed from JSON payload
@freezed
class TelemetryData with _$TelemetryData {
  const factory TelemetryData({
    required String deviceId,
    // Water levels (0–100 percentage)
    required double ohtLevel,  // Overhead Tank %
    required double ugtLevel,  // Underground Tank %
    // Motor states
    required String ohtMotorState,  // 'ON' | 'OFF' | 'DRY_RUN'
    required String ugtMotorState,
    // Power
    required double powerWatts,      // Current draw W
    required double energyKwh,       // Session energy kWh
    // Firmware reported
    required String firmwareOhtMode, // 'AUTO' | 'MANUAL'
    required String firmwareUgtMode, // 'AUTO' | 'MANUAL'
    required bool isSystemSuspended, // SYS_SUSPENDED flag
    required DateTime timestamp,
  }) = _TelemetryData;

  factory TelemetryData.fromJson(Map<String, dynamic> json) =>
      _$TelemetryDataFromJson(json);
}
