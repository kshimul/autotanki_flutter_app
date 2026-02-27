import '../models/telemetry_model.dart';
import '../models/telemetry_cache.dart';
import '../../core/utils/id_hash.dart';

// ─────────────────────────────────────────────────────────────────────────────
// TELEMETRY MAPPER — Freezed model ↔ Isar collection
// Decouples business logic from storage implementation.
// Swap Isar for another DB here without touching any feature code.
// ─────────────────────────────────────────────────────────────────────────────

extension TelemetryDataMapper on TelemetryData {
  TelemetryCache toIsarCache() {
    final cache = TelemetryCache()
      ..id = telemetryIsarId(deviceId, timestamp)
      ..deviceId = deviceId
      ..timestamp = timestamp
      ..ohtLevel = ohtLevel
      ..ugtLevel = ugtLevel
      ..ohtMotorState = ohtMotorState
      ..ugtMotorState = ugtMotorState
      ..powerWatts = powerWatts
      ..energyKwh = energyKwh
      ..firmwareMode = firmwareMode
      ..isSystemSuspended = isSystemSuspended;
    return cache;
  }
}

extension TelemetryCacheMapper on TelemetryCache {
  TelemetryData toModel() => TelemetryData(
        deviceId: deviceId,
        timestamp: timestamp,
        ohtLevel: ohtLevel,
        ugtLevel: ugtLevel,
        ohtMotorState: ohtMotorState,
        ugtMotorState: ugtMotorState,
        powerWatts: powerWatts,
        energyKwh: energyKwh,
        firmwareMode: firmwareMode,
        isSystemSuspended: isSystemSuspended,
      );
}
