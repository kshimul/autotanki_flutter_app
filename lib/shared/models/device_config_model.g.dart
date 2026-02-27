// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TankConfigImpl _$$TankConfigImplFromJson(Map<String, dynamic> json) =>
    _$TankConfigImpl(
      deviceId: json['deviceId'] as String,
      predefSizeId: json['predefSizeId'] as String?,
      ohtCapacityLiters: (json['ohtCapacityLiters'] as num?)?.toDouble(),
      ugtCapacityLiters: (json['ugtCapacityLiters'] as num?)?.toDouble(),
      ohtLowThreshold: (json['ohtLowThreshold'] as num?)?.toDouble(),
      ugtLowThreshold: (json['ugtLowThreshold'] as num?)?.toDouble(),
      ohtHighThreshold: (json['ohtHighThreshold'] as num?)?.toDouble(),
      ugtHighThreshold: (json['ugtHighThreshold'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$TankConfigImplToJson(_$TankConfigImpl instance) =>
    <String, dynamic>{
      'deviceId': instance.deviceId,
      'predefSizeId': instance.predefSizeId,
      'ohtCapacityLiters': instance.ohtCapacityLiters,
      'ugtCapacityLiters': instance.ugtCapacityLiters,
      'ohtLowThreshold': instance.ohtLowThreshold,
      'ugtLowThreshold': instance.ugtLowThreshold,
      'ohtHighThreshold': instance.ohtHighThreshold,
      'ugtHighThreshold': instance.ugtHighThreshold,
    };

_$DeviceShareImpl _$$DeviceShareImplFromJson(Map<String, dynamic> json) =>
    _$DeviceShareImpl(
      id: json['id'] as String,
      deviceId: json['deviceId'] as String,
      sharedWithUserId: json['sharedWithUserId'] as String,
      sharedWithEmail: json['sharedWithEmail'] as String,
      permissionLevel: json['permissionLevel'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$DeviceShareImplToJson(_$DeviceShareImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deviceId': instance.deviceId,
      'sharedWithUserId': instance.sharedWithUserId,
      'sharedWithEmail': instance.sharedWithEmail,
      'permissionLevel': instance.permissionLevel,
      'createdAt': instance.createdAt.toIso8601String(),
    };

_$CreateShareRequestImpl _$$CreateShareRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateShareRequestImpl(
      email: json['email'] as String,
      permissionLevel: json['permissionLevel'] as String,
    );

Map<String, dynamic> _$$CreateShareRequestImplToJson(
        _$CreateShareRequestImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'permissionLevel': instance.permissionLevel,
    };
