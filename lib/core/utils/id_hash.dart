// ─────────────────────────────────────────────────────────────────────────────
// FNV-1a HASH — Stable String → int64 for Isar primary keys
// Used to convert composite string IDs (e.g. "${deviceMac}_${microseconds}")
// into stable integer IDs for Isar collections.
//
// This is the same algorithm Isar uses internally (fastHash).
// Source: https://isar.dev/schema.html#string-ids
// ─────────────────────────────────────────────────────────────────────────────

int fastHash(String string) {
  var hash = 0xcbf29ce484222325;

  var i = 0;
  while (i < string.length) {
    final codeUnit = string.codeUnitAt(i++);
    hash ^= codeUnit >> 8;
    hash *= 0x100000001b3;
    hash ^= codeUnit & 0xFF;
    hash *= 0x100000001b3;
  }

  return hash;
}

/// Generates a collision-resistant Isar ID for telemetry records.
/// Format: "${deviceMac}_${timestamp.microsecondsSinceEpoch}"
/// Example: "AA:BB:CC:DD:EE:FF_1740000000000000"
int telemetryIsarId(String deviceMac, DateTime timestamp) {
  final composite = '${deviceMac}_${timestamp.microsecondsSinceEpoch}';
  return fastHash(composite);
}
