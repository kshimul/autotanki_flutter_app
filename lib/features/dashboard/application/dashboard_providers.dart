import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/network/mqtt_client.dart';
import '../../../features/provisioning/data/device_repository.dart';
import '../../../shared/models/device_model.dart';
import '../../../shared/models/telemetry_model.dart';
import '../../dashboard/data/telemetry_cache_repository.dart';
import '../../dashboard/application/motor_intent_notifier.dart';
import 'dart:convert';

// ─────────────────────────────────────────────────────────────────────────────
// DEVICE SELECTOR PROVIDER
// Manages the selected device across the app. On switch, re-subscribes MQTT.
// ─────────────────────────────────────────────────────────────────────────────

class DeviceSelectorNotifier extends StateNotifier<Device?> {
  final DeviceRepository _deviceRepo;
  final AppMqttClient _mqtt;

  DeviceSelectorNotifier(this._deviceRepo, this._mqtt) : super(null);

  // Loads devices and selects the first one if none is selected yet.
  // Safe to call repeatedly — won't override an existing manual selection.
  Future<void> loadDevices() async {
    try {
      final devices = await _deviceRepo.getMyDevices();
      if (devices.isNotEmpty && state == null) {
        await selectDevice(devices.first);
      }
    } catch (e) {
      // Fail silently — UI reads deviceListProvider for error state
    }
  }

  // Forces a full re-fetch and auto-selects the first device.
  // Call this after pull-to-refresh or after admin assigns a new device.
  Future<void> refreshDevices() async {
    try {
      final devices = await _deviceRepo.getMyDevices();
      if (devices.isNotEmpty) {
        // Auto-select first device if nothing is selected, or keep current if still present
        final currentId = state?.id;
        final stillExists = devices.any((d) => d.id == currentId);
        if (!stillExists) {
          await selectDevice(devices.first);
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
  return DeviceSelectorNotifier(
    ref.watch(deviceRepositoryProvider),
    ref.watch(mqttClientProvider),
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
      final rawJson = jsonDecode(msg.payload) as Map<String, dynamic>;
      
      // The ESP32 sends a flat struct: { ohtLevel, ugtLevel, ohtState, ugtState, energyWh, etc }
      // We map it to the Freezed JSON schema expected by TelemetryData
      final mappedJson = <String, dynamic>{
        'deviceId': device.id,
        'ohtLevel': (rawJson['ohtLevel'] as num?)?.toDouble() ?? device.ohtWaterLevel ?? 0.0,
        'ugtLevel': (rawJson['ugtLevel'] as num?)?.toDouble() ?? device.ugtWaterLevel ?? 0.0,
        'ohtMotorState': rawJson['ohtState'] ?? device.ohtState ?? (device.oht?['state'] as String?) ?? 'OFF',
        'ugtMotorState': rawJson['ugtState'] ?? (device.ugt?['state'] as String?) ?? 'OFF',
        'powerWatts': 0.0,
        'energyKwh': (rawJson['energyWh'] as num?) != null ? (rawJson['energyWh'] as num).toDouble() / 1000.0 : 0.0,
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
