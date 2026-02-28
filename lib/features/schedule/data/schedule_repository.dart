import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/network/api_constants.dart';
import '../../../core/network/dio_client.dart';
import '../../../shared/models/schedule_model.dart';

// ─────────────────────────────────────────────────────────────────────────────
// SCHEDULE REPOSITORY — CRUD for automation schedules
// ─────────────────────────────────────────────────────────────────────────────

class ScheduleRepository {
  final Dio _dio;
  ScheduleRepository(this._dio);

  Future<List<Schedule>> getSchedules(String deviceId) async {
    final resp = await _dio.get(ApiConstants.schedules(deviceId));
    return (resp.data as List)
        .map((e) => Schedule.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<Schedule> createSchedule(String deviceId, CreateScheduleRequest req) async {
    final resp = await _dio.post(
      ApiConstants.schedules(deviceId),
      data: req.toJson(),
    );
    return Schedule.fromJson(resp.data as Map<String, dynamic>);
  }

  Future<Schedule> toggleSchedule(String deviceId, String scheduleId, bool isActive) async {
    final resp = await _dio.put(
      ApiConstants.scheduleById(deviceId, scheduleId),
      data: {'isActive': isActive},
    );
    return Schedule.fromJson(resp.data as Map<String, dynamic>);
  }

  Future<void> deleteSchedule(String deviceId, String scheduleId) async {
    await _dio.delete(ApiConstants.scheduleById(deviceId, scheduleId));
  }
}

final scheduleRepositoryProvider = Provider<ScheduleRepository>((ref) {
  return ScheduleRepository(ref.watch(dioProvider));
});

// ─── Providers ───────────────────────────────────────────────────────────────
final schedulesProvider = FutureProvider.autoDispose
    .family<List<Schedule>, String>((ref, deviceId) async {
  return ref.watch(scheduleRepositoryProvider).getSchedules(deviceId);
});
