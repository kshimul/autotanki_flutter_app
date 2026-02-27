import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import '../utils/env_config.dart';

// ─────────────────────────────────────────────────────────────────────────────
// MQTT CLIENT (core/network)
// RESPONSIBILITY: Connection lifecycle ONLY.
// Telemetry payload parsing lives in each feature's mqtt_data_source.dart.
//
// Protocol:
// - WSS on port 443 (production) — firewall-proof
// - Exponential backoff with jitter on reconnect
// - No command publishing (motor control goes via HTTP only)
// ─────────────────────────────────────────────────────────────────────────────

class AppMqttClient {
  MqttServerClient? _client;
  bool _intentionalDisconnect = false;
  int _reconnectAttempts = 0;

  // Callback for connection state changes → drives ConnectionStateNotifier
  Function(bool connected)? onConnectionChanged;

  // Callback for incoming payloads → routed to feature data sources
  Function(String topic, String payload)? onMessageReceived;

  Future<void> connect({required String userId}) async {
    _intentionalDisconnect = false;
    _reconnectAttempts = 0;
    await _doConnect(userId: userId);
  }

  Future<void> _doConnect({required String userId}) async {
    final brokerUrl = EnvConfig.mqttBrokerUrl
        .replaceAll('ws://', '')
        .replaceAll('wss://', '');

    _client = MqttServerClient.withPort(
      brokerUrl,
      'flutter_${userId}_${DateTime.now().millisecondsSinceEpoch}',
      int.tryParse(EnvConfig.mqttBrokerPort) ?? 9001,
    );

    _client!
      ..logging(on: EnvConfig.isDevelopment)
      ..keepAlivePeriod = 30
      ..connectTimeoutPeriod = 10000
      ..autoReconnect = false // We handle reconnect manually with backoff
      ..onConnected = _onConnected
      ..onDisconnected = _onDisconnected;
    _client!.onSubscribed = (topic) => _log('Subscribed: $topic');
    _client!
      .websocketProtocols = MqttClientConstants.protocolsSingleDefault;

    try {
      await _client!.connect();
    } catch (e) {
      _log('MQTT connect error: $e');
      FirebaseCrashlytics.instance.recordError(
        'MQTT connection failed',
        StackTrace.current,
        reason: e.toString(),
        fatal: false,
      );
      onConnectionChanged?.call(false);
      await _scheduleReconnect(userId: userId);
    }

    _client!.updates?.listen((messages) {
      for (final message in messages) {
        final topic = message.topic;
        final payload = MqttPublishPayload.bytesToStringAsString(
          (message.payload as MqttPublishMessage).payload.message,
        );
        onMessageReceived?.call(topic, payload);
        _messageController.add((topic: topic, payload: payload));
      }
    });
  }

  void subscribe(String topic) {
    _client?.subscribe(topic, MqttQos.atLeastOnce);
  }

  void unsubscribe(String topic) {
    _client?.unsubscribe(topic);
  }

  // ── Device topic helpers ──────────────────────────────────────────────────
  static List<String> _deviceTopics(String deviceId) => [
        'devices/$deviceId/telemetry',
        'devices/$deviceId/status',
      ];

  void subscribeDeviceTopics(String deviceId) {
    for (final t in _deviceTopics(deviceId)) {
      subscribe(t);
    }
  }

  void unsubscribeDeviceTopics(String deviceId) {
    for (final t in _deviceTopics(deviceId)) {
      unsubscribe(t);
    }
  }

  // ── Message stream ────────────────────────────────────────────────────────
  /// Broadcasts decoded MQTT messages. Listen and filter by `msg.topic`.
  Stream<({String topic, String payload})> get messageStream => _messageController.stream;
  final _messageController =
      StreamController<({String topic, String payload})>.broadcast();

  /// Intentional disconnect (app background, logout, device switch cleanup)
  void disconnect() {
    _intentionalDisconnect = true;
    _reconnectAttempts = 0;
    _client?.disconnect();
    _messageController.close();
  }

  void _onConnected() {
    _reconnectAttempts = 0;
    _log('MQTT connected');
    onConnectionChanged?.call(true);
  }

  void _onDisconnected() {
    _log('MQTT disconnected (intentional: $_intentionalDisconnect)');
    onConnectionChanged?.call(false);
    if (!_intentionalDisconnect) {
      // This is an unexpected drop — Crashlytics non-fatal log
      FirebaseCrashlytics.instance.recordError(
        'MQTT unexpectedly disconnected',
        StackTrace.current,
        fatal: false,
      );
    }
  }

  // Exponential backoff: 1s, 2s, 4s, 8s, 16s, max 30s
  Future<void> _scheduleReconnect({required String userId}) async {
    if (_intentionalDisconnect) return;
    _reconnectAttempts++;
    final baseDelay = (1 << _reconnectAttempts.clamp(0, 5)).toDouble();
    // Add jitter: ±0.5 * baseDelay
    final jitter = baseDelay * 0.5 * (DateTime.now().millisecond / 1000);
    final delay = Duration(milliseconds: ((baseDelay + jitter) * 1000).toInt());
    _log('MQTT reconnecting in ${delay.inSeconds}s (attempt $_reconnectAttempts)');
    await Future.delayed(delay);
    if (!_intentionalDisconnect) {
      await _doConnect(userId: userId);
    }
  }

  bool get isConnected =>
      _client?.connectionStatus?.state == MqttConnectionState.connected;

  void _log(String msg) {
    if (EnvConfig.isDevelopment) {
      // ignore: avoid_print
      print('[MQTT] $msg');
    }
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// PROVIDER
// ─────────────────────────────────────────────────────────────────────────────

final mqttClientProvider = Provider<AppMqttClient>((ref) {
  final client = AppMqttClient();
  ref.onDispose(client.disconnect);
  return client;
});
