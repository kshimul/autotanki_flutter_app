import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/network/api_constants.dart';
import '../../../core/network/dio_client.dart';
import '../../../shared/models/user_model.dart';
import '../../../shared/models/support_model.dart';
import '../../../shared/models/device_config_model.dart';

// ─────────────────────────────────────────────────────────────────────────────
// SETTINGS REPOSITORY — Profile, tank config, shares, support
// ─────────────────────────────────────────────────────────────────────────────

class SettingsRepository {
  final Dio _dio;
  SettingsRepository(this._dio);

  // ─── Profile ────────────────────────────────────────────────────────────────
  Future<User> updateProfile({
    String? fullName,
    String? phone,
  }) async {
    final resp = await _dio.put(
      ApiConstants.profile,
      data: {
        if (fullName != null) 'fullName': fullName,
        if (phone != null) 'phone': phone,
      },
    );
    return User.fromJson(resp.data as Map<String, dynamic>);
  }

  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    await _dio.post(ApiConstants.changePassword, data: {
      'oldPassword': oldPassword,
      'newPassword': newPassword,
    });
  }

  // ─── Tank Config (includes predefSizeId — API-verified) ───────────────────
  Future<TankConfig> getTankConfig(String deviceId) async {
    final resp = await _dio.get(ApiConstants.tankConfig(deviceId));
    return TankConfig.fromJson(resp.data as Map<String, dynamic>);
  }

  Future<TankConfig> updateTankConfig(String deviceId, TankConfig config) async {
    final resp = await _dio.put(
      ApiConstants.tankConfig(deviceId),
      data: config.toJson(),
    );
    return TankConfig.fromJson(resp.data as Map<String, dynamic>);
  }

  // ─── Tank types for predefSizeId selector ─────────────────────────────────
  Future<List<Map<String, dynamic>>> getTankTypes() async {
    final resp = await _dio.get(ApiConstants.tankTypes);
    return (resp.data as List).cast<Map<String, dynamic>>();
  }

  // ─── Device Sharing ───────────────────────────────────────────────────────
  Future<List<DeviceShare>> getShares(String deviceId) async {
    final resp = await _dio.get(ApiConstants.deviceShares(deviceId));
    return (resp.data as List)
        .map((e) => DeviceShare.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<DeviceShare> shareDevice(String deviceId, CreateShareRequest req) async {
    final resp = await _dio.post(
      ApiConstants.deviceShares(deviceId),
      data: req.toJson(),
    );
    return DeviceShare.fromJson(resp.data as Map<String, dynamic>);
  }

  Future<void> removeShare(String deviceId, String shareId) async {
    await _dio.delete(ApiConstants.deviceShareById(deviceId, shareId));
  }

  // ─── Support tickets ──────────────────────────────────────────────────────
  Future<List<SupportTicket>> getTickets() async {
    final resp = await _dio.get(ApiConstants.supportTickets);
    return (resp.data as List)
        .map((e) => SupportTicket.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<SupportTicket> createTicket(CreateTicketRequest req) async {
    final resp = await _dio.post(ApiConstants.supportTickets, data: req.toJson());
    return SupportTicket.fromJson(resp.data as Map<String, dynamic>);
  }
}

final settingsRepositoryProvider = Provider<SettingsRepository>((ref) {
  return SettingsRepository(ref.watch(dioProvider));
});

// ─── Providers ───────────────────────────────────────────────────────────────
final tankTypesProvider = FutureProvider.autoDispose<List<Map<String, dynamic>>>((ref) {
  return ref.watch(settingsRepositoryProvider).getTankTypes();
});

final tankConfigProvider =
    FutureProvider.autoDispose.family<TankConfig, String>((ref, deviceId) {
  return ref.watch(settingsRepositoryProvider).getTankConfig(deviceId);
});

final deviceSharesProvider =
    FutureProvider.autoDispose.family<List<DeviceShare>, String>((ref, deviceId) {
  return ref.watch(settingsRepositoryProvider).getShares(deviceId);
});
