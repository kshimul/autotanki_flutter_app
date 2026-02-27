import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription_model.freezed.dart';
part 'subscription_model.g.dart';

@freezed
class SubscriptionPackage with _$SubscriptionPackage {
  const factory SubscriptionPackage({
    required String id,
    required String name,
    required String description,
    required double price,
    required String currency,     // 'BDT'
    required int durationDays,
    required List<String> features,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _SubscriptionPackage;

  factory SubscriptionPackage.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionPackageFromJson(json);
}

@freezed
class Subscription with _$Subscription {
  const factory Subscription({
    required String id,
    required String userId,
    required String deviceId,
    required String packageId,
    required String status,       // 'ACTIVE' | 'EXPIRED' | 'SUSPENDED'
    required DateTime startDate,
    required DateTime endDate,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Subscription;

  factory Subscription.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionFromJson(json);
}

// Subscribe request — Swagger-verified: requires gateway field
@freezed
class SubscribeRequest with _$SubscribeRequest {
  const factory SubscribeRequest({
    required String deviceId,
    required String packageId,
    required String gateway, // 'BKASH' | 'SSLCOMMERZ'
  }) = _SubscribeRequest;

  factory SubscribeRequest.fromJson(Map<String, dynamic> json) =>
      _$SubscribeRequestFromJson(json);
}
