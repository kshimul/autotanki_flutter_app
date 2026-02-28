import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/design_tokens.dart';
import '../../../core/utils/haptics.dart';
import '../data/dashboard_repository.dart';
import 'motor_intent_state.dart';

// ─────────────────────────────────────────────────────────────────────────────
// MOTOR INTENT NOTIFIER — Per-motor intent controller
// Instantiated per motor via .family(motorId + deviceId)
// ─────────────────────────────────────────────────────────────────────────────

class MotorIntentNotifier
    extends StateNotifier<MotorIntentState> {
  final DashboardRepository _repo;
  final String _deviceId;
  final String _motorId;
  Timer? _timeoutTimer;

  MotorIntentNotifier({
    required DashboardRepository repo,
    required String deviceId,
    required String motorId,
    required bool initialIsRunning,
  })  : _repo = repo,
        _deviceId = deviceId,
        _motorId = motorId,
        super(MotorIntentState.idle(
          motorId: motorId,
          isRunning: initialIsRunning,
        ));

  // ── Toggle motor (user intent) ────────────────────────────────────────────
  Future<void> toggle() async {
    // Ignore if already pending
    if (_isPending) return;

    final currentlyRunning = _currentIsRunning;
    final targetAction = currentlyRunning ? 'OFF' : 'ON';

    // 1. Show pending intent immediately (optimistic UI)
    state = MotorIntentState.pending(
      motorId: _motorId,
      isRunning: currentlyRunning,
      pendingAction: targetAction,
    );
    await AppHaptics.light();

    // 2. Start timeout guard — rolls back if server doesn't confirm in time
    _startTimeoutTimer(currentlyRunning);

    try {
      // 3. Send HTTP command (NEVER MQTT)
      await _repo.controlMotor(
        deviceId: _deviceId,
        motor: _motorId,
        action: targetAction,
      );

      // 4. Server accepted — transition to active
      _timeoutTimer?.cancel();
      state = MotorIntentState.active(
        motorId: _motorId,
        isRunning: !currentlyRunning, // new state
      );
      await AppHaptics.medium();

      // 5. Settle back to idle after brief active display
      await Future.delayed(AppDurations.normal);
      if (mounted) {
        state = MotorIntentState.idle(
          motorId: _motorId,
          isRunning: !currentlyRunning,
        );
      }
    } catch (e) {
      // Server rejected — roll back
      _timeoutTimer?.cancel();
      state = MotorIntentState.error(
        motorId: _motorId,
        isRunning: currentlyRunning, // rolled back
        message: _parseError(e),
      );
      await AppHaptics.error();

      // Auto-clear error after 3s
      await Future.delayed(const Duration(seconds: 3));
      if (mounted) {
        state = MotorIntentState.idle(
          motorId: _motorId,
          isRunning: currentlyRunning,
        );
      }
    }
  }

  // ── Update from live MQTT telemetry (real-time sync) ─────────────────────
  /// Called by dashboard notifier when new telemetry arrives.
  /// Only updates if NOT pending (don't interrupt active user intent).
  void syncFromTelemetry(bool isRunning) {
    if (!_isPending) {
      state = MotorIntentState.idle(
        motorId: _motorId,
        isRunning: isRunning,
      );
    }
  }

  // ── Helpers ───────────────────────────────────────────────────────────────
  bool get _isPending =>
      state.maybeWhen(pending: (_, __, ___) => true, orElse: () => false);

  bool get _currentIsRunning => state.when(
        idle: (_, r) => r,
        pending: (_, r, __) => r,
        active: (_, r) => r,
        error: (_, r, __) => r,
      );

  void _startTimeoutTimer(bool previousState) {
    _timeoutTimer?.cancel();
    _timeoutTimer = Timer(AppDurations.intentTimeout, () {
      if (_isPending && mounted) {
        state = MotorIntentState.error(
          motorId: _motorId,
          isRunning: previousState,
          message: 'Request timed out. Please try again.',
        );
        AppHaptics.error();
      }
    });
  }

  String _parseError(Object e) {
    if (e is DioException && e.response?.data is Map) {
      final mapData = e.response!.data as Map;
      final apiError = mapData['error']?['message'] ?? mapData['message'];
      if (apiError != null) return apiError.toString();
    }

    final msg = e.toString().toLowerCase();
    if (msg.contains('403') || msg.contains('billing')) {
      return 'সাবস্ক্রিপশন নেই। Billing থেকে সক্রিয় করুন।';
    }
    if (msg.contains('connection')) {
      return 'ইন্টারনেট সংযোগ নেই।';
    }
    return 'মোটর চালু করা যায়নি। আবার চেষ্টা করুন।';
  }

  @override
  void dispose() {
    _timeoutTimer?.cancel();
    super.dispose();
  }
}

// Family provider — one notifier per (deviceId, motorId) pair
final motorIntentProvider = StateNotifierProvider.autoDispose.family<
    MotorIntentNotifier, MotorIntentState, ({String deviceId, String motorId, bool initialIsRunning})>(
  (ref, args) => MotorIntentNotifier(
    repo: ref.watch(dashboardRepositoryProvider),
    deviceId: args.deviceId,
    motorId: args.motorId,
    initialIsRunning: args.initialIsRunning,
  ),
);
