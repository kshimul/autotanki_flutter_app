// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'telemetry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TelemetryDataImpl _$$TelemetryDataImplFromJson(Map<String, dynamic> json) =>
    _$TelemetryDataImpl(
      deviceId: json['deviceId'] as String,
      ohtLevel: (json['ohtLevel'] as num).toDouble(),
      ugtLevel: (json['ugtLevel'] as num).toDouble(),
      ohtMotorState: json['ohtMotorState'] as String,
      ugtMotorState: json['ugtMotorState'] as String,
      powerWatts: (json['powerWatts'] as num).toDouble(),
      energyKwh: (json['energyKwh'] as num).toDouble(),
      firmwareMode: json['firmwareMode'] as String,
      isSystemSuspended: json['isSystemSuspended'] as bool,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$$TelemetryDataImplToJson(_$TelemetryDataImpl instance) =>
    <String, dynamic>{
      'deviceId': instance.deviceId,
      'ohtLevel': instance.ohtLevel,
      'ugtLevel': instance.ugtLevel,
      'ohtMotorState': instance.ohtMotorState,
      'ugtMotorState': instance.ugtMotorState,
      'powerWatts': instance.powerWatts,
      'energyKwh': instance.energyKwh,
      'firmwareMode': instance.firmwareMode,
      'isSystemSuspended': instance.isSystemSuspended,
      'timestamp': instance.timestamp.toIso8601String(),
    };
