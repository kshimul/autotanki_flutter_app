import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_model.freezed.dart';
part 'payment_model.g.dart';

// Dynamic payment gateway from /payments/gateways — Backend-Driven UI
@freezed
class PaymentGateway with _$PaymentGateway {
  const factory PaymentGateway({
    required String id,
    required String name,          // 'bKash' | 'SSLCommerz' | 'Nagad'
    required String code,          // 'BKASH' | 'SSLCOMMERZ'
    required String logoUrl,
    @Default(true) bool isEnabled,
    @Default(0) int sortOrder,
  }) = _PaymentGateway;

  factory PaymentGateway.fromJson(Map<String, dynamic> json) =>
      _$PaymentGatewayFromJson(json);
}

@freezed
class Payment with _$Payment {
  const factory Payment({
    required String id,
    required String userId,
    required String subscriptionId,
    required double amount,
    required String currency,
    required String gateway,       // 'BKASH' | 'SSLCOMMERZ'
    required String status,        // 'PENDING' | 'SUCCESS' | 'FAILED' | 'CANCELLED'
    String? paymentUrl,            // WebView URL (sensitive — stripped before Crashlytics)
    String? transactionId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Payment;

  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);
}
