// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeviceImpl _$$DeviceImplFromJson(Map<String, dynamic> json) => _$DeviceImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      claimCode: json['claimCode'] as String,
      macAddress: json['macAddress'] as String?,
      tankTypeId: json['tankTypeId'] as String?,
      isLabelPrinted: json['isLabelPrinted'] as bool? ?? false,
      ownerId: json['ownerId'] as String,
      status: json['status'] as String,
      lastSeenAt: json['lastSeenAt'] == null
          ? null
          : DateTime.parse(json['lastSeenAt'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$DeviceImplToJson(_$DeviceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'claimCode': instance.claimCode,
      'macAddress': instance.macAddress,
      'tankTypeId': instance.tankTypeId,
      'isLabelPrinted': instance.isLabelPrinted,
      'ownerId': instance.ownerId,
      'status': instance.status,
      'lastSeenAt': instance.lastSeenAt?.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_$MotorControlRequestImpl _$$MotorControlRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$MotorControlRequestImpl(
      action: json['action'] as String,
    );

Map<String, dynamic> _$$MotorControlRequestImplToJson(
        _$MotorControlRequestImpl instance) =>
    <String, dynamic>{
      'action': instance.action,
    };

_$ClaimDeviceRequestImpl _$$ClaimDeviceRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$ClaimDeviceRequestImpl(
      claimCode: json['claimCode'] as String,
    );

Map<String, dynamic> _$$ClaimDeviceRequestImplToJson(
        _$ClaimDeviceRequestImpl instance) =>
    <String, dynamic>{
      'claimCode': instance.claimCode,
    };
