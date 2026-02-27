import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule_model.freezed.dart';
part 'schedule_model.g.dart';

@freezed
class Schedule with _$Schedule {
  const factory Schedule({
    required String id,
    required String deviceId,
    required String name,
    required String tank,         // 'oht' | 'ugt'
    required String action,       // 'ON' | 'OFF'
    required String cronExpression, // e.g. "0 23 * * *"
    @Default(true) bool isActive,
    String? description,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Schedule;

  factory Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);
}

@freezed
class CreateScheduleRequest with _$CreateScheduleRequest {
  const factory CreateScheduleRequest({
    required String deviceId,
    required String name,
    required String tank,
    required String action,
    required String cronExpression,
    String? description,
  }) = _CreateScheduleRequest;

  factory CreateScheduleRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateScheduleRequestFromJson(json);
}
