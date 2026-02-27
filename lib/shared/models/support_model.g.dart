// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SupportTicketImpl _$$SupportTicketImplFromJson(Map<String, dynamic> json) =>
    _$SupportTicketImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      deviceId: json['deviceId'] as String?,
      subject: json['subject'] as String,
      description: json['description'] as String,
      category: $enumDecode(_$TicketCategoryEnumMap, json['category']),
      status: $enumDecodeNullable(_$TicketStatusEnumMap, json['status']) ??
          TicketStatus.open,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$SupportTicketImplToJson(_$SupportTicketImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'deviceId': instance.deviceId,
      'subject': instance.subject,
      'description': instance.description,
      'category': _$TicketCategoryEnumMap[instance.category]!,
      'status': _$TicketStatusEnumMap[instance.status]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$TicketCategoryEnumMap = {
  TicketCategory.general: 'GENERAL',
  TicketCategory.billing: 'BILLING',
  TicketCategory.technical: 'TECHNICAL',
  TicketCategory.device: 'DEVICE',
  TicketCategory.other: 'OTHER',
};

const _$TicketStatusEnumMap = {
  TicketStatus.open: 'OPEN',
  TicketStatus.inProgress: 'IN_PROGRESS',
  TicketStatus.resolved: 'RESOLVED',
  TicketStatus.closed: 'CLOSED',
};

_$CreateTicketRequestImpl _$$CreateTicketRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateTicketRequestImpl(
      deviceId: json['deviceId'] as String?,
      subject: json['subject'] as String,
      description: json['description'] as String,
      category: $enumDecode(_$TicketCategoryEnumMap, json['category']),
    );

Map<String, dynamic> _$$CreateTicketRequestImplToJson(
        _$CreateTicketRequestImpl instance) =>
    <String, dynamic>{
      'deviceId': instance.deviceId,
      'subject': instance.subject,
      'description': instance.description,
      'category': _$TicketCategoryEnumMap[instance.category]!,
    };
