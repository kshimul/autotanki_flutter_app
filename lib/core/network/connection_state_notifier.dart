import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../network/mqtt_client.dart';

// ─────────────────────────────────────────────────────────────────────────────
// DEVICE CONNECTION STATE
// ─────────────────────────────────────────────────────────────────────────────

/// Formalized connection state enum — drives UI badges and reconnect logic.
enum DeviceConnectionState {
  online,               // Server reachable + MQTT connected
  connecting,           // MQTT reconnecting (exponential backoff in progress)
  offline,              // No internet — server unreachable
  hardwareDisconnected, // Server up but device lastSeenAt > 5min threshold
}

extension DeviceConnectionStateX on DeviceConnectionState {
  bool get isServerReachable =>
      this == DeviceConnectionState.online ||
      this == DeviceConnectionState.hardwareDisconnected;

  bool get isMqttConnected => this == DeviceConnectionState.online;

  String get label => switch (this) {
        DeviceConnectionState.online               => 'Online',
        DeviceConnectionState.connecting           => 'Connecting...',
        DeviceConnectionState.offline              => 'Offline',
        DeviceConnectionState.hardwareDisconnected => 'Device Offline',
      };
}

// ─────────────────────────────────────────────────────────────────────────────
// CONNECTION STATE NOTIFIER
// Listens to MQTT connection events + AppLifecycleState changes.
// 500ms debounce prevents rapid connect/disconnect during brief app switches.
// ─────────────────────────────────────────────────────────────────────────────

class ConnectionStateNotifier
    extends StateNotifier<DeviceConnectionState>
    with WidgetsBindingObserver {
  final AppMqttClient _mqttClient;
  String? _currentUserId;

  ConnectionStateNotifier(this._mqttClient)
      : super(DeviceConnectionState.offline) {
    WidgetsBinding.instance.addObserver(this);
    _mqttClient.onConnectionChanged = _onMqttConnectionChanged;
  }

  void _onMqttConnectionChanged(bool connected) {
    if (connected) {
      state = DeviceConnectionState.online;
    } else {
      // Only move to 'connecting' if we have a user — otherwise stay offline
      if (_currentUserId != null &&
          state != DeviceConnectionState.offline) {
        state = DeviceConnectionState.connecting;
      }
    }
  }

  Future<void> connectForUser(String userId) async {
    _currentUserId = userId;
    state = DeviceConnectionState.connecting;
    await _mqttClient.connect(userId: userId);
  }

  void markHardwareDisconnected() {
    state = DeviceConnectionState.hardwareDisconnected;
  }

  // ─── AppLifecycle: disconnect on background, reconnect on foreground ───────
  // 500ms debounce (AppDurations.mqttDebounce) avoids rate-limiting on
  // rapid task-switching (e.g. user checks notification then returns)
  DateTime? _lastLifecycleChange;

  @override
  void didChangeAppLifecycleState(AppLifecycleState appState) {
    final now = DateTime.now();
    if (_lastLifecycleChange != null &&
        now.difference(_lastLifecycleChange!).inMilliseconds < 500) {
      return; // Debounce
    }
    _lastLifecycleChange = now;

    switch (appState) {
      case AppLifecycleState.paused:
      case AppLifecycleState.inactive:
      case AppLifecycleState.detached:
        _mqttClient.disconnect();
        break;
      case AppLifecycleState.resumed:
        if (_currentUserId != null) {
          state = DeviceConnectionState.connecting;
          _mqttClient.connect(userId: _currentUserId!);
        }
      case AppLifecycleState.hidden:
        break; // No action needed
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _mqttClient.disconnect();
    super.dispose();
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// PROVIDERS
// ─────────────────────────────────────────────────────────────────────────────

final connectionStateProvider =
    StateNotifierProvider<ConnectionStateNotifier, DeviceConnectionState>(
  (ref) {
    final mqttClient = ref.watch(mqttClientProvider);
    return ConnectionStateNotifier(mqttClient);
  },
);
