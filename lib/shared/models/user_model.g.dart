// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String,
      fullName: json['fullName'] as String?,
      email: json['email'] as String,
      phone: json['phone'] as String?,
      role:
          $enumDecodeNullable(_$UserRoleEnumMap, json['role']) ?? UserRole.user,
      avatarUrl: json['avatarUrl'] as String?,
      address: json['address'] as String?,
      suspended: json['suspended'] as bool?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'email': instance.email,
      'phone': instance.phone,
      'role': _$UserRoleEnumMap[instance.role]!,
      'avatarUrl': instance.avatarUrl,
      'address': instance.address,
      'suspended': instance.suspended,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$UserRoleEnumMap = {
  UserRole.user: 'USER',
  UserRole.admin: 'ADMIN',
  UserRole.superAdmin: 'SUPER_ADMIN',
  UserRole.support: 'SUPPORT',
  UserRole.technician: 'TECHNICIAN',
};

_$FcmTokenRequestImpl _$$FcmTokenRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$FcmTokenRequestImpl(
      token: json['token'] as String,
      platform: json['platform'] as String,
    );

Map<String, dynamic> _$$FcmTokenRequestImplToJson(
        _$FcmTokenRequestImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'platform': instance.platform,
    };
