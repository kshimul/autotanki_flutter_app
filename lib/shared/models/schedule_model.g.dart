// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScheduleImpl _$$ScheduleImplFromJson(Map<String, dynamic> json) =>
    _$ScheduleImpl(
      id: json['id'] as String,
      deviceId: json['deviceId'] as String,
      name: json['name'] as String,
      tank: json['tank'] as String,
      action: json['action'] as String,
      cronExpression: json['cronExpression'] as String,
      isActive: json['isActive'] as bool? ?? true,
      description: json['description'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$ScheduleImplToJson(_$ScheduleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deviceId': instance.deviceId,
      'name': instance.name,
      'tank': instance.tank,
      'action': instance.action,
      'cronExpression': instance.cronExpression,
      'isActive': instance.isActive,
      'description': instance.description,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_$CreateScheduleRequestImpl _$$CreateScheduleRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateScheduleRequestImpl(
      deviceId: json['deviceId'] as String,
      name: json['name'] as String,
      tank: json['tank'] as String,
      action: json['action'] as String,
      cronExpression: json['cronExpression'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$CreateScheduleRequestImplToJson(
        _$CreateScheduleRequestImpl instance) =>
    <String, dynamic>{
      'deviceId': instance.deviceId,
      'name': instance.name,
      'tank': instance.tank,
      'action': instance.action,
      'cronExpression': instance.cronExpression,
      'description': instance.description,
    };
