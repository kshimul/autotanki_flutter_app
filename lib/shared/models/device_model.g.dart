// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeviceImpl _$$DeviceImplFromJson(Map<String, dynamic> json) => _$DeviceImpl(
      id: json['id'] as String,
      nickname: json['nickname'] as String?,
      claimCode: json['claimCode'] as String?,
      macAddress: json['macAddress'] as String?,
      tankTypeId: json['tankTypeId'] as String?,
      isLabelPrinted: json['isLabelPrinted'] as bool? ?? false,
      ownerId: json['ownerId'] as String?,
      status: json['status'] as String?,
      lastSeenAt: json['lastSeenAt'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      suspended: json['suspended'] as bool?,
      isOnline: json['isOnline'] as bool?,
      wifiSignal: (json['wifiSignal'] as num?)?.toInt(),
      ohtWaterLevel: (json['ohtWaterLevel'] as num?)?.toDouble(),
      ugtWaterLevel: (json['ugtWaterLevel'] as num?)?.toDouble(),
      ohtEnabled: json['ohtEnabled'] as bool?,
      ohtMode: json['ohtMode'] as String?,
      ohtState: json['ohtState'] as String?,
      ugtEnabled: json['ugtEnabled'] as bool?,
      oht: json['oht'] as Map<String, dynamic>?,
      ugt: json['ugt'] as Map<String, dynamic>?,
      subscription: json['subscription'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$DeviceImplToJson(_$DeviceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'claimCode': instance.claimCode,
      'macAddress': instance.macAddress,
      'tankTypeId': instance.tankTypeId,
      'isLabelPrinted': instance.isLabelPrinted,
      'ownerId': instance.ownerId,
      'status': instance.status,
      'lastSeenAt': instance.lastSeenAt,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'suspended': instance.suspended,
      'isOnline': instance.isOnline,
      'wifiSignal': instance.wifiSignal,
      'ohtWaterLevel': instance.ohtWaterLevel,
      'ugtWaterLevel': instance.ugtWaterLevel,
      'ohtEnabled': instance.ohtEnabled,
      'ohtMode': instance.ohtMode,
      'ohtState': instance.ohtState,
      'ugtEnabled': instance.ugtEnabled,
      'oht': instance.oht,
      'ugt': instance.ugt,
      'subscription': instance.subscription,
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
      macAddress: json['macAddress'] as String,
      signature: json['signature'] as String,
    );

Map<String, dynamic> _$$ClaimDeviceRequestImplToJson(
        _$ClaimDeviceRequestImpl instance) =>
    <String, dynamic>{
      'claimCode': instance.claimCode,
      'macAddress': instance.macAddress,
      'signature': instance.signature,
    };
