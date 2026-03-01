// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashboardResponseImpl _$$DashboardResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$DashboardResponseImpl(
      success: json['success'] as bool? ?? false,
      data: DashboardData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DashboardResponseImplToJson(
        _$DashboardResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

_$DashboardDataImpl _$$DashboardDataImplFromJson(Map<String, dynamic> json) =>
    _$DashboardDataImpl(
      summary:
          DashboardSummary.fromJson(json['summary'] as Map<String, dynamic>),
      devices: (json['devices'] as List<dynamic>?)
              ?.map((e) => Device.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      recentInvoices: json['recentInvoices'] as List<dynamic>? ?? const [],
    );

Map<String, dynamic> _$$DashboardDataImplToJson(_$DashboardDataImpl instance) =>
    <String, dynamic>{
      'summary': instance.summary,
      'devices': instance.devices,
      'recentInvoices': instance.recentInvoices,
    };

_$DashboardSummaryImpl _$$DashboardSummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$DashboardSummaryImpl(
      totalDevices: (json['totalDevices'] as num?)?.toInt() ?? 0,
      onlineDevices: (json['onlineDevices'] as num?)?.toInt() ?? 0,
      suspendedDevices: (json['suspendedDevices'] as num?)?.toInt() ?? 0,
      activeSubscriptions: (json['activeSubscriptions'] as num?)?.toInt() ?? 0,
      openTickets: (json['openTickets'] as num?)?.toInt() ?? 0,
      sharedDevices: (json['sharedDevices'] as num?)?.toInt() ?? 0,
      unpaidInvoices: (json['unpaidInvoices'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$DashboardSummaryImplToJson(
        _$DashboardSummaryImpl instance) =>
    <String, dynamic>{
      'totalDevices': instance.totalDevices,
      'onlineDevices': instance.onlineDevices,
      'suspendedDevices': instance.suspendedDevices,
      'activeSubscriptions': instance.activeSubscriptions,
      'openTickets': instance.openTickets,
      'sharedDevices': instance.sharedDevices,
      'unpaidInvoices': instance.unpaidInvoices,
    };
