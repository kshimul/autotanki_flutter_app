// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentGatewayImpl _$$PaymentGatewayImplFromJson(Map<String, dynamic> json) =>
    _$PaymentGatewayImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      code: json['code'] as String,
      logoUrl: json['logoUrl'] as String,
      isEnabled: json['isEnabled'] as bool? ?? true,
      sortOrder: (json['sortOrder'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$PaymentGatewayImplToJson(
        _$PaymentGatewayImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'logoUrl': instance.logoUrl,
      'isEnabled': instance.isEnabled,
      'sortOrder': instance.sortOrder,
    };

_$PaymentImpl _$$PaymentImplFromJson(Map<String, dynamic> json) =>
    _$PaymentImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      subscriptionId: json['subscriptionId'] as String,
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String,
      gateway: json['gateway'] as String,
      status: json['status'] as String,
      paymentUrl: json['paymentUrl'] as String?,
      transactionId: json['transactionId'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$PaymentImplToJson(_$PaymentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'subscriptionId': instance.subscriptionId,
      'amount': instance.amount,
      'currency': instance.currency,
      'gateway': instance.gateway,
      'status': instance.status,
      'paymentUrl': instance.paymentUrl,
      'transactionId': instance.transactionId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
