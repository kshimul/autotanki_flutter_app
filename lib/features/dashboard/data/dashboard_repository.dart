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

  // System mode config — PUT /devices/{id}/motors/{motor}/config
  // motor: 'oht' | 'ugt'  |  mode: 'AUTO' | 'MANUAL'
  Future<void> setMode({
    required String deviceId,
    required String motor,
    required String mode,
  }) async {
    await _dio.put(
      ApiConstants.motorConfig(deviceId, motor),
      data: {'mode': mode},
    );
  }

  // Subscription check — used by intent guard to verify billing freshness
  Future<Map<String, dynamic>> getSubscriptionStatus(String deviceId) async {
    try {
      final resp = await _dio.get(ApiConstants.subscriptions);
      final rawData = resp.data as Map<String, dynamic>;
      final data = rawData['data'] as Map<String, dynamic>? ?? rawData;
      final subscriptions = (data['subscriptions'] as List?) ?? [];
      
      for (final s in subscriptions) {
         final subMap = s as Map<String, dynamic>;
         if (subMap['deviceId'] == deviceId && subMap['status'] == 'ACTIVE') {
            return subMap;
         }
      }
      return {};
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) return {};
      rethrow;
    }
  }
}

final dashboardRepositoryProvider = Provider<DashboardRepository>((ref) {
  return DashboardRepository(ref.watch(dioProvider));
});
