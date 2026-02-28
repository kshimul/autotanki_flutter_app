import 'package:freezed_annotation/freezed_annotation.dart';
import 'device_model.dart';

part 'dashboard_summary_model.freezed.dart';
part 'dashboard_summary_model.g.dart';

@freezed
class DashboardResponse with _$DashboardResponse {
  const factory DashboardResponse({
    @Default(false) bool success,
    required DashboardData data,
  }) = _DashboardResponse;

  factory DashboardResponse.fromJson(Map<String, dynamic> json) =>
      _$DashboardResponseFromJson(json);
}

@freezed
class DashboardData with _$DashboardData {
  const factory DashboardData({
    required DashboardSummary summary,
    @Default([]) List<Device> devices,
    @Default([]) List<dynamic> recentInvoices,
  }) = _DashboardData;

  factory DashboardData.fromJson(Map<String, dynamic> json) =>
      _$DashboardDataFromJson(json);
}

@freezed
class DashboardSummary with _$DashboardSummary {
  const factory DashboardSummary({
    @Default(0) int totalDevices,
    @Default(0) int onlineDevices,
    @Default(0) int suspendedDevices,
    @Default(0) int activeSubscriptions,
    @Default(0) int openTickets,
    @Default(0) int sharedDevices,
    @Default(0) int unpaidInvoices,
  }) = _DashboardSummary;

  factory DashboardSummary.fromJson(Map<String, dynamic> json) =>
      _$DashboardSummaryFromJson(json);
}
