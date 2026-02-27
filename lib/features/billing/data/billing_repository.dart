import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/network/api_constants.dart';
import '../../../core/network/dio_client.dart';
import '../../../shared/models/payment_model.dart';
import '../../../shared/models/subscription_model.dart';

// ─────────────────────────────────────────────────────────────────────────────
// BILLING REPOSITORY
// Payment gateways fetched from server (Backend-Driven UI).
// PaymentUrl comes from server — opened in WebView v4+ (flutter_inappwebview).
// ─────────────────────────────────────────────────────────────────────────────

class BillingRepository {
  final Dio _dio;
  BillingRepository(this._dio);

  // Backend-Driven: server controls which gateways are enabled + sort order
  Future<List<PaymentGateway>> getGateways() async {
    final resp = await _dio.get(ApiConstants.paymentGateways);
    return (resp.data as List)
        .map((e) => PaymentGateway.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<List<SubscriptionPackage>> getPackages() async {
    final resp = await _dio.get(ApiConstants.subscriptionPackages);
    return (resp.data as List)
        .map((e) => SubscriptionPackage.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<Subscription?> getActiveSubscription(String deviceId) async {
    try {
      final resp = await _dio.get(ApiConstants.deviceSubscription(deviceId));
      return Subscription.fromJson(resp.data as Map<String, dynamic>);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) return null; // No subscription yet
      rethrow;
    }
  }

  // Returns Payment with paymentUrl → open in WebView
  Future<Payment> initiatePayment(SubscribeRequest req) async {
    final resp = await _dio.post(
      ApiConstants.subscriptions,
      data: req.toJson(),
    );
    return Payment.fromJson(resp.data as Map<String, dynamic>);
  }

  // Poll payment status after WebView redirect (webhook race guard)
  Future<Payment> getPaymentStatus(String paymentId) async {
    final resp = await _dio.get(ApiConstants.paymentById(paymentId));
    return Payment.fromJson(resp.data as Map<String, dynamic>);
  }
}

final billingRepositoryProvider = Provider<BillingRepository>((ref) {
  return BillingRepository(ref.watch(dioProvider));
});

// ─── Providers ───────────────────────────────────────────────────────────────

final gatewaysProvider = FutureProvider.autoDispose<List<PaymentGateway>>((ref) {
  return ref.watch(billingRepositoryProvider).getGateways();
});

final packagesProvider = FutureProvider.autoDispose<List<SubscriptionPackage>>((ref) {
  return ref.watch(billingRepositoryProvider).getPackages();
});

final activeSubscriptionProvider =
    FutureProvider.autoDispose.family<Subscription?, String>((ref, deviceId) {
  return ref.watch(billingRepositoryProvider).getActiveSubscription(deviceId);
});

// Selected package for purchase flow
final selectedPackageProvider =
    StateProvider<SubscriptionPackage?>((_) => null);

// Selected gateway from gateway selector sheet
final selectedGatewayProvider =
    StateProvider<PaymentGateway?>((_) => null);
