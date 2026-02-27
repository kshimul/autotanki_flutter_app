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

  Future<void> loadDevices() async {
    final devices = await _deviceRepo.getMyDevices();
    if (devices.isNotEmpty && state == null) {
      await selectDevice(devices.first);
    }
  }

  Future<void> selectDevice(Device device) async {
    final previous = state;
    state = device;

    // Re-subscribe MQTT topics on device switch
    if (previous != null && previous.id != device.id) {
      _mqtt.unsubscribeDeviceTopics(previous.id);
    }
    _mqtt.subscribeDeviceTopics(device.id);
  }
}

final deviceSelectorProvider =
    StateNotifierProvider<DeviceSelectorNotifier, Device?>((ref) {
  return DeviceSelectorNotifier(
    ref.watch(deviceRepositoryProvider),
    ref.watch(mqttClientProvider),
  );
});

// Convenience: list of all user devices
final deviceListProvider = FutureProvider<List<Device>>((ref) async {
  return ref.watch(deviceRepositoryProvider).getMyDevices();
});

// ─────────────────────────────────────────────────────────────────────────────
// TELEMETRY STREAM PROVIDER — MQTT → TelemetryData stream
// Bridge: raw MQTT bytes → parse JSON → TelemetryData → write Isar cache
// ─────────────────────────────────────────────────────────────────────────────

final telemetryStreamProvider =
    StreamProvider.family<TelemetryData, String>((ref, deviceId) async* {
  final mqtt   = ref.watch(mqttClientProvider);
  final cache  = ref.watch(telemetryCacheRepositoryProvider);

  final controller = StreamController<TelemetryData>.broadcast();

  // Listen to decoded MQTT messages for this device's telemetry topic
  final topic = 'devices/$deviceId/telemetry';
  final sub = mqtt.messageStream
      .where((msg) => msg.topic == topic)
      .listen((msg) {
    try {
      final json = jsonDecode(msg.payload) as Map<String, dynamic>;
      // Inject deviceId (not in MQTT payload — inferred from topic)
      json['deviceId'] = deviceId;
      final data = TelemetryData.fromJson(json);

      // Write-through: persist to Isar for 30-day history
      cache?.upsert(data);

      // Sync motor intent states with live telemetry
      // (doesn't interrupt pending user intents — handled inside notifier)
      final ohtArgs = (deviceId: deviceId, motorId: 'oht', initialIsRunning: data.ohtMotorState == 'ON');
      final ugtArgs = (deviceId: deviceId, motorId: 'ugt', initialIsRunning: data.ugtMotorState == 'ON');
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
