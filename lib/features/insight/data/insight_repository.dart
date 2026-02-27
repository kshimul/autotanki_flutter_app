import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../features/dashboard/data/telemetry_cache_repository.dart';
import '../../../shared/models/telemetry_model.dart';

// ─────────────────────────────────────────────────────────────────────────────
// INSIGHT REPOSITORY — API + Isar query layer for analytics
// ─────────────────────────────────────────────────────────────────────────────

class InsightRepository {
  final TelemetryCacheRepository? _cache;
  InsightRepository(this._cache);

  // Get telemetry for a date range from local Isar cache
  Future<List<TelemetryData>> getLocalInsight({
    required String deviceId,
    required DateTime from,
    required DateTime to,
  }) {
    if (_cache == null) return Future.value([]);
    return _cache!.getForDeviceInRange(
      deviceId: deviceId,
      from: from,
      to: to,
    );
  }

  // Get last N data points for quick chart display
  Future<List<TelemetryData>> getRecentInsight({
    required String deviceId,
    int limit = 200,
  }) {
    if (_cache == null) return Future.value([]);
    return _cache!.getRecentForDevice(deviceId, limit: limit);
  }
}

final insightRepositoryProvider = Provider<InsightRepository>((ref) {
  return InsightRepository(ref.watch(telemetryCacheRepositoryProvider));
});

// ─── Date range enum ─────────────────────────────────────────────────────────
enum InsightRange { day, week, month }

extension InsightRangeExt on InsightRange {
  String get label => switch (this) {
        InsightRange.day => '24h',
        InsightRange.week => '7d',
        InsightRange.month => '30d',
      };

  DateTime get from => switch (this) {
        InsightRange.day => DateTime.now().subtract(const Duration(hours: 24)),
        InsightRange.week => DateTime.now().subtract(const Duration(days: 7)),
        InsightRange.month => DateTime.now().subtract(const Duration(days: 30)),
      };
}

// ─── Provider ────────────────────────────────────────────────────────────────
final selectedInsightRangeProvider =
    StateProvider<InsightRange>((_) => InsightRange.day);

final insightDataProvider = FutureProvider.autoDispose
    .family<List<TelemetryData>, String>((ref, deviceId) async {
  final range = ref.watch(selectedInsightRangeProvider);
  final repo = ref.watch(insightRepositoryProvider);
  return repo.getLocalInsight(
    deviceId: deviceId,
    from: range.from,
    to: DateTime.now(),
  );
});
