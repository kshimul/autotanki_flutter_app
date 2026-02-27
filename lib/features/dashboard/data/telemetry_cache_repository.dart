import 'package:isar/isar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../shared/models/telemetry_cache.dart';
import '../../../shared/models/telemetry_model.dart';
import '../../../shared/mappers/telemetry_mapper.dart';

// ─────────────────────────────────────────────────────────────────────────────
// ISAR TELEMETRY CACHE REPOSITORY
// Write-through cache: MQTT → TelemetryData → TelemetryCache (Isar)
// Retention policy: 30 days, enforced on app launch via pruneOldTelemetry().
// ─────────────────────────────────────────────────────────────────────────────

class TelemetryCacheRepository {
  final Isar _isar;

  TelemetryCacheRepository(this._isar);

  // ── Write latest telemetry packet ─────────────────────────────────────────
  Future<void> upsert(TelemetryData data) async {
    await _isar.writeTxn(() async {
      await _isar.telemetryCaches.put(data.toIsarCache());
    });
  }

  // ── Get latest reading for a device (dashboard initial load) ─────────────
  Future<TelemetryData?> getLatestForDevice(String deviceId) async {
    final result = await _isar.telemetryCaches
        .where()
        .deviceIdEqualTo(deviceId)
        .sortByTimestampDesc()
        .limit(1)
        .findFirst();
    return result?.toModel();
  }

  // ── Get last N readings for a device (Insight chart) ─────────────────────
  Future<List<TelemetryData>> getRecentForDevice(
    String deviceId, {
    int limit = 100,
  }) async {
    final results = await _isar.telemetryCaches
        .where()
        .deviceIdEqualTo(deviceId)
        .sortByTimestampDesc()
        .limit(limit)
        .findAll();
    return results.map((e) => e.toModel()).toList();
  }

  // ── Get readings in a time range (Insight date filter) ───────────────────
  Future<List<TelemetryData>> getForDeviceInRange({
    required String deviceId,
    required DateTime from,
    required DateTime to,
  }) async {
    final results = await _isar.telemetryCaches
        .where()
        .deviceIdEqualTo(deviceId)
        .filter()
        .timestampBetween(from, to)
        .sortByTimestamp()
        .findAll();
    return results.map((e) => e.toModel()).toList();
  }

  // ── 30-day retention prune (call on app launch) ───────────────────────────
  Future<int> pruneOldTelemetry({int retentionDays = 30}) async {
    final cutoff = DateTime.now().subtract(Duration(days: retentionDays));
    int deleted = 0;
    await _isar.writeTxn(() async {
      deleted = await _isar.telemetryCaches
          .where()
          .filter()
          .timestampLessThan(cutoff)
          .deleteAll();
    });
    return deleted;
  }

  // ── Clear all for a device (on device removal) ────────────────────────────
  Future<void> clearDevice(String deviceId) async {
    await _isar.writeTxn(() async {
      await _isar.telemetryCaches
          .where()
          .deviceIdEqualTo(deviceId)
          .deleteAll();
    });
  }
}

// ─── Isar instance provider (nullable — null when Isar failed to open) ─────────
final isarProvider = Provider<Isar?>((ref) => null); // overridden in main.dart

final telemetryCacheRepositoryProvider =
    Provider<TelemetryCacheRepository?>((ref) {
  final isar = ref.watch(isarProvider);
  if (isar == null) return null; // Isar not available — cache disabled
  return TelemetryCacheRepository(isar);
});
