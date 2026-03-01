import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/network/mqtt_client.dart';
import '../../../features/provisioning/data/device_repository.dart';
import '../../../shared/models/device_model.dart';
import '../../../shared/models/telemetry_model.dart';
import '../../dashboard/data/telemetry_cache_repository.dart';
import '../../dashboard/application/motor_intent_notifier.dart';
import 'dart:convert';
import 'package:isar/isar.dart';
import '../../../main.dart';
import '../../../shared/models/device_cache.dart';

// ─────────────────────────────────────────────────────────────────────────────
// DEVICE SELECTOR PROVIDER
// Manages the selected device across the app. On switch, re-subscribes MQTT.
// ─────────────────────────────────────────────────────────────────────────────

class DeviceSelectorNotifier extends StateNotifier<Device?> {
  final DeviceRepository _deviceRepo;
  final AppMqttClient _mqtt;
  final Isar? _isar;

  DeviceSelectorNotifier(this._deviceRepo, this._mqtt, this._isar) : super(null);

  // Loads devices and selects the first one if none is selected yet.
  // Implements Stale-While-Revalidate (Offline-First) pattern.
  Future<void> loadDevices() async {
    // 1. Instantly load from Isar Cache
    if (_isar != null && state == null) {
      final cached = await _isar!.deviceCaches.where().findAll();
      if (cached.isNotEmpty) {
        // Hydrate from Isar and show UI instantly
        final models = cached.map((c) => c.toModel()).toList();
        await selectDevice(models.first);
      }
    }

    // 2. Fetch fresh data from API silently in the background
    try {
      final devices = await _deviceRepo.getMyDevices();
      
      // Save fresh devices to Isar
      if (_isar != null && devices.isNotEmpty) {
        await _isar!.writeTxn(() async {
          await _isar!.deviceCaches.clear(); // Prune deleted devices
          await _isar!.deviceCaches.putAll(devices.map((d) => d.toIsarCache()).toList());
        });
      }

      // 3. Update UI with fresh data if we didn't have cache OR data changed (reference equality check works with Freezed)
      if (devices.isNotEmpty) {
        if (state == null) {
          await selectDevice(devices.first);
        } else {
          // If the selected device was updated, re-emit to trigger rebuilds
          final updated = devices.firstWhere((d) => d.id == state!.id, orElse: () => devices.first);
          if (updated != state) {
            state = updated;
          }
        }
      }
    } catch (e) {
      // Fail silently — UI reads deviceListProvider for error state,
      // and we already showed the cached version!
    }
  }

  // Forces a full re-fetch and auto-selects the first device.
  // Call this after pull-to-refresh or after admin assigns a new device.
  Future<void> refreshDevices() async {
    try {
      final devices = await _deviceRepo.getMyDevices();
      
      // Save fresh devices to Isar
      if (_isar != null && devices.isNotEmpty) {
        await _isar!.writeTxn(() async {
          await _isar!.deviceCaches.clear(); // Prune deleted devices
          await _isar!.deviceCaches.putAll(devices.map((d) => d.toIsarCache()).toList());
        });
      }

      if (devices.isNotEmpty) {
        // Auto-select first device if nothing is selected, or keep current if still present
        final currentId = state?.id;
        final stillExists = devices.any((d) => d.id == currentId);
        if (!stillExists) {
          await selectDevice(devices.first);
        } else {
          final updated = devices.firstWhere((d) => d.id == currentId);
          if (updated != state) {
            state = updated;
          }
        }
      } else {
        // No devices — clear selection
        state = null;
      }
    } catch (e) {
      // Fail silently — UI reads deviceListProvider for error state
    }
  }

  Future<void> selectDevice(Device device) async {
    final previous = state;
    state = device;

    // Re-subscribe MQTT topics on device switch
    if (previous != null && previous.id != device.id) {
      if (previous.macAddress != null) {
        _mqtt.unsubscribeDeviceTopics(previous.macAddress!);
      }
    }
    if (device.macAddress != null) {
      _mqtt.subscribeDeviceTopics(device.macAddress!);
    }
  }
}

final deviceSelectorProvider =
    StateNotifierProvider<DeviceSelectorNotifier, Device?>((ref) {
  final isar = ref.watch(isarProvider);
  return DeviceSelectorNotifier(
    ref.watch(deviceRepositoryProvider),
    ref.watch(mqttClientProvider),
    isar,
  );
});

// Convenience: list of all user devices (auto-dispose so it always re-fetches)
final deviceListProvider = FutureProvider.autoDispose<List<Device>>((ref) async {
  return ref.read(deviceRepositoryProvider).getMyDevices();
});

// ─────────────────────────────────────────────────────────────────────────────
// TELEMETRY STREAM PROVIDER — MQTT → TelemetryData stream
// Bridge: raw MQTT bytes → parse JSON → TelemetryData → write Isar cache
// ─────────────────────────────────────────────────────────────────────────────

final telemetryStreamProvider =
    StreamProvider.family<TelemetryData, Device>((ref, device) async* {
  final mqtt   = ref.watch(mqttClientProvider);
  final cache  = ref.watch(telemetryCacheRepositoryProvider);

  final controller = StreamController<TelemetryData>.broadcast();

  // Listen to decoded MQTT messages for this device's telemetry topic
  final topic = 'v1/devices/${device.macAddress}/telemetry';
  final sub = mqtt.messageStream
      .where((msg) => msg.topic == topic)
      .listen((msg) {
    try {
      final decoded = jsonDecode(msg.payload);
      if (decoded is! Map<String, dynamic>) return;
      final rawJson = decoded;

      double parseD(dynamic val, double fallback) {
        if (val == null) return fallback;
        if (val is num) return val.toDouble();
        if (val is String) return double.tryParse(val) ?? fallback;
        return fallback;
      }
      
      // The ESP32 sends a flat struct: { ohtLevel, ugtLevel, ohtState, ugtState, energyWh, etc }
      // We map it to the Freezed JSON schema expected by TelemetryData
      final mappedJson = <String, dynamic>{
        'deviceId': device.id,
        'ohtLevel': parseD(rawJson['ohtLevel'], device.ohtWaterLevel ?? 0.0),
        'ugtLevel': parseD(rawJson['ugtLevel'], device.ugtWaterLevel ?? 0.0),
        'ohtMotorState': rawJson['ohtState'] ?? device.ohtState ?? (device.oht?['state'] as String?) ?? 'OFF',
        'ugtMotorState': rawJson['ugtState'] ?? (device.ugt?['state'] as String?) ?? 'OFF',
        'powerWatts': 0.0,
        'energyKwh': parseD(rawJson['energyWh'], 0.0) / 1000.0,
        'firmwareOhtMode': device.ohtMode ?? (device.oht?['mode'] as String?) ?? 'AUTO',
        'firmwareUgtMode': (device.ugt?['mode'] as String?) ?? 'AUTO',
        'isSystemSuspended': device.suspended ?? false,
        'timestamp': DateTime.now().toIso8601String(),
      };

      final data = TelemetryData.fromJson(mappedJson);

      // Write-through: persist to Isar for 30-day history
      cache?.upsert(data);

      // Sync motor intent states with live telemetry
      // (doesn't interrupt pending user intents — handled inside notifier)
      final ohtArgs = (deviceId: device.id, motorId: 'oht', initialIsRunning: data.ohtMotorState == 'ON');
      final ugtArgs = (deviceId: device.id, motorId: 'ugt', initialIsRunning: data.ugtMotorState == 'ON');
      ref.read(motorIntentProvider(ohtArgs).notifier).syncFromTelemetry(data.ohtMotorState == 'ON');
      ref.read(motorIntentProvider(ugtArgs).notifier).syncFromTelemetry(data.ugtMotorState == 'ON');

      controller.add(data);
    } catch (e) {
      // Malformed JSON from firmware — skip silently (not Crashlytics worthy)
    }
  });

  ref.onDispose(() {
    sub.cancel();
    controller.close();
  });

  yield* controller.stream;
});

// Cached snapshot on first load (Isar) — replaced by live stream when MQTT connects
final cachedTelemetryProvider =
    FutureProvider.family<TelemetryData?, String>((ref, deviceId) async {
  return ref
      .watch(telemetryCacheRepositoryProvider)
      ?.getLatestForDevice(deviceId);
});
