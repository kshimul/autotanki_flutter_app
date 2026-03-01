import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/network/api_constants.dart';
import '../../../core/network/dio_client.dart';
import '../../../shared/models/device_model.dart';

import '../../../shared/models/dashboard_summary_model.dart';
import '../../../shared/models/tank_type_model.dart';

// ─────────────────────────────────────────────────────────────────────────────
// DEVICE REPOSITORY — Provisioning + device management API calls
// ─────────────────────────────────────────────────────────────────────────────

class DeviceRepository {
  final Dio _dio;
  DeviceRepository(this._dio);

  Future<DashboardResponse> getDashboardSummary() async {
    final response = await _dio.get(ApiConstants.dashboard);
    return DashboardResponse.fromJson(response.data as Map<String, dynamic>);
  }

  Future<TankTypesResponse> getTankTypes() async {
    final response = await _dio.get(ApiConstants.tankTypes);
    return TankTypesResponse.fromJson(response.data as Map<String, dynamic>);
  }

  Future<Device> claimDevice(String claimCode, String macAddress, String signature) async {
    final response = await _dio.post(
      ApiConstants.claimDevice,
      data: ClaimDeviceRequest(
        claimCode: claimCode,
        macAddress: macAddress,
        signature: signature,
      ).toJson(),
    );
    final rawData = response.data as Map<String, dynamic>;
    final data = rawData['data'] as Map<String, dynamic>? ?? rawData;
    final deviceJson = data.containsKey('device') 
        ? data['device'] as Map<String, dynamic> 
        : data;
    return Device.fromJson(deviceJson);
  }

  Future<List<Device>> getMyDevices() async {
    try {
      final response = await _dio.get(ApiConstants.devices);
      final rawData = response.data as Map<String, dynamic>;
      final dataMap = rawData['data'] as Map<String, dynamic>? ?? {};
      
      // Backend returns { success: true, data: { devices: [ ... ] } }
      final list = dataMap['devices'] is List 
          ? dataMap['devices'] as List<dynamic>
          : [];
          
      return list
          .map((e) => Device.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      final msg = e.response?.data is Map ? e.response?.data['message'] : null;
      throw Exception(msg ?? e.message);
    } catch (e, st) {
      print('=== getMyDevices PARSING ERROR ===');
      print(e);
      print(st);
      throw Exception('Failed parsing devices: $e');
    }
  }

  Future<Device> getDevice(String deviceId) async {
    final response = await _dio.get(ApiConstants.deviceById(deviceId));
    final rawData = response.data as Map<String, dynamic>;
    final data = rawData['data'] as Map<String, dynamic>? ?? rawData;
    final deviceJson = data.containsKey('device') 
        ? data['device'] as Map<String, dynamic> 
        : data;
    return Device.fromJson(deviceJson);
  }

  Future<void> deleteDevice(String deviceId) async {
    await _dio.delete(ApiConstants.deviceById(deviceId));
  }

  Future<void> updateDeviceSettings(String deviceId, {String? nickname}) async {
    await _dio.put(
      ApiConstants.deviceSettings(deviceId),
      data: {
        if (nickname != null) 'nickname': nickname,
      },
    );
  }
}

final deviceRepositoryProvider = Provider<DeviceRepository>((ref) {
  return DeviceRepository(ref.watch(dioProvider));
});
