import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/network/api_constants.dart';
import '../../../core/network/dio_client.dart';
import '../../../shared/models/device_model.dart';

// ─────────────────────────────────────────────────────────────────────────────
// DEVICE REPOSITORY — Provisioning + device management API calls
// ─────────────────────────────────────────────────────────────────────────────

class DeviceRepository {
  final Dio _dio;
  DeviceRepository(this._dio);

  // Claim device — claimCode only (secretKey is BLE-only, never sent here)
  Future<Device> claimDevice(String claimCode) async {
    final response = await _dio.post(
      ApiConstants.claimDevice,
      data: ClaimDeviceRequest(claimCode: claimCode).toJson(),
    );
    return Device.fromJson(response.data as Map<String, dynamic>);
  }

  Future<List<Device>> getMyDevices() async {
    final response = await _dio.get(ApiConstants.devices);
    final list = response.data as List<dynamic>;
    return list
        .map((e) => Device.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<Device> getDevice(String deviceId) async {
    final response = await _dio.get(ApiConstants.deviceById(deviceId));
    return Device.fromJson(response.data as Map<String, dynamic>);
  }

  Future<void> deleteDevice(String deviceId) async {
    await _dio.delete(ApiConstants.deviceById(deviceId));
  }
}

final deviceRepositoryProvider = Provider<DeviceRepository>((ref) {
  return DeviceRepository(ref.watch(dioProvider));
});
