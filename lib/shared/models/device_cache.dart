import 'dart:convert';
import 'package:isar/isar.dart';
import 'device_model.dart';

part 'device_cache.g.dart';

// ─────────────────────────────────────────────────────────────────────────────
// ISAR DEVICE CACHE COLLECTION
// Enables Zero-Delay Offline-First rendering of the Dashboard.
// Users never see a loading spinner for device configurations.
// ─────────────────────────────────────────────────────────────────────────────

@Collection()
class DeviceCache {
  // We use fastHash(deviceId) as the Isar Id
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String deviceId;

  // Primary Info
  late String displayName;
  String? localNickname; // User-defined alias that overrides displayName on UI only
  String? macAddress;
  String? tankTypeId;
  String? ownerId;
  String? status;
  
  // Realtime overrides
  bool? isOnline;
  int? wifiSignal;
  double? ohtWaterLevel;
  double? ugtWaterLevel;
  
  // OHT Config (JSON String)
  String? ohtJson;
  
  // UGT Config (JSON String)
  String? ugtJson;

  // We store the original raw JSON string to reconstruct the Freezed Device model accurately
  late String rawJson;
  
  late DateTime lastUpdated;
}

extension DeviceToCacheMapper on Device {
  DeviceCache toIsarCache() {
    final cache = DeviceCache()
      ..deviceId = id
      ..displayName = displayName
      ..macAddress = macAddress
      ..tankTypeId = tankTypeId
      ..ownerId = ownerId
      ..status = status
      ..isOnline = isOnline
      ..wifiSignal = wifiSignal
      ..ohtWaterLevel = ohtWaterLevel
      ..ugtWaterLevel = ugtWaterLevel?.toDouble()
      ..ohtJson = oht != null ? jsonEncode(oht) : null
      ..ugtJson = ugt != null ? jsonEncode(ugt) : null
      ..localNickname = nickname // Map API nickname to local, though it may be overwritten later
      ..rawJson = jsonEncode(toJson())
      ..lastUpdated = DateTime.now();

    // Fast-hash the ID (same logic as telemetry cache)
    cache.id = _fastHash(id);
    return cache;
  }
}

extension CacheToDeviceMapper on DeviceCache {
  Device toModel() {
    // Reconstruct the exact structured JSON we saved
    final Map<String, dynamic> json = jsonDecode(rawJson);
    return Device.fromJson(json);
  }
}

/// FNV-1a 64-bit hash algorithm to generate a deterministic integer ID from a String.
int _fastHash(String string) {
  var hash = 0xcbf29ce484222325;
  for (var i = 0; i < string.length; i++) {
    hash ^= string.codeUnitAt(i);
    hash *= 0x100000001b3;
  }
  return hash & 0x7FFFFFFFFFFFFFFF; // Ensure positive 64-bit integer
}
