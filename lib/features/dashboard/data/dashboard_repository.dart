import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/network/api_constants.dart';
import '../../../core/network/dio_client.dart';
import '../../../shared/models/device_model.dart';

// ─────────────────────────────────────────────────────────────────────────────
// DASHBOARD REPOSITORY — Motor control + Subscription status check
//
// CRITICAL ARCHITECTURE RULE:
//   Motor commands use HTTP ONLY — never MQTT publish.
//   This enforces server-side billing and audit logging.
// ─────────────────────────────────────────────────────────────────────────────

class DashboardRepository {
  final Dio _dio;
  DashboardRepository(this._dio);

  // Motor control — Swagger: POST /devices/{id}/motors/{motor}/control
  // motor: 'oht' | 'ugt'  |  action: 'ON' | 'OFF'
  Future<void> controlMotor({
    required String deviceId,
    required String motor,   // 'oht' | 'ugt'
    required String action,  // 'ON' | 'OFF'
  }) async {
    await _dio.post(
      ApiConstants.motorControl(deviceId, motor),
      data: MotorControlRequest(action: action).toJson(),
    );
  }

  // Subscription check — used by intent guard to verify billing freshness
  Future<Map<String, dynamic>> getSubscriptionStatus(String deviceId) async {
    final response = await _dio.get(ApiConstants.deviceSubscription(deviceId));
    return response.data as Map<String, dynamic>;
  }
}

final dashboardRepositoryProvider = Provider<DashboardRepository>((ref) {
  return DashboardRepository(ref.watch(dioProvider));
});
