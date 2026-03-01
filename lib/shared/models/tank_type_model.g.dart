// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tank_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TankTypesResponseImpl _$$TankTypesResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$TankTypesResponseImpl(
      success: json['success'] as bool? ?? false,
      data: TankTypesData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TankTypesResponseImplToJson(
        _$TankTypesResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

_$TankTypesDataImpl _$$TankTypesDataImplFromJson(Map<String, dynamic> json) =>
    _$TankTypesDataImpl(
      tankTypes: (json['tankTypes'] as List<dynamic>?)
              ?.map((e) => TankType.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$TankTypesDataImplToJson(_$TankTypesDataImpl instance) =>
    <String, dynamic>{
      'tankTypes': instance.tankTypes,
    };

_$TankTypeImpl _$$TankTypeImplFromJson(Map<String, dynamic> json) =>
    _$TankTypeImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      shape: json['shape'] as String,
      predefSizes: (json['predefSizes'] as List<dynamic>?)
              ?.map((e) => TankSize.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$TankTypeImplToJson(_$TankTypeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'shape': instance.shape,
      'predefSizes': instance.predefSizes,
    };

_$TankSizeImpl _$$TankSizeImplFromJson(Map<String, dynamic> json) =>
    _$TankSizeImpl(
      id: json['id'] as String,
      tankTypeId: json['tankTypeId'] as String,
      capacityLiter: (json['capacityLiter'] as num).toInt(),
      diameterMm: (json['diameterMm'] as num).toInt(),
      heightMm: (json['heightMm'] as num).toInt(),
    );

Map<String, dynamic> _$$TankSizeImplToJson(_$TankSizeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tankTypeId': instance.tankTypeId,
      'capacityLiter': instance.capacityLiter,
      'diameterMm': instance.diameterMm,
      'heightMm': instance.heightMm,
    };
