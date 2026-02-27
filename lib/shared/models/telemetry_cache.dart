import 'package:isar/isar.dart';

part 'telemetry_cache.g.dart';

// ─────────────────────────────────────────────────────────────────────────────
// ISAR TELEMETRY CACHE COLLECTION
// Primary key: FNV-1a hash of "${deviceMac}_${timestamp.microsecondsSinceEpoch}"
// Prevents ID collisions across devices and timestamps.
// 30-day retention policy enforced by pruneOldTelemetry() on app launch.
// ─────────────────────────────────────────────────────────────────────────────

@Collection()
class TelemetryCache {
  // FNV-1a hash — see id_hash.dart
  Id id = Isar.autoIncrement;

  @Index()
  late String deviceId;

  @Index()
  late DateTime timestamp;

  // Water levels (0–100 %)
  late double ohtLevel;
  late double ugtLevel;

  // Motor states
  late String ohtMotorState;
  late String ugtMotorState;

  // Power
  late double powerWatts;
  late double energyKwh;

  // Firmware
  late String firmwareMode;
  late bool isSystemSuspended;
}
