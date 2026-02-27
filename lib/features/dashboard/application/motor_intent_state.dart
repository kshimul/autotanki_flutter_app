import 'package:freezed_annotation/freezed_annotation.dart';

part 'motor_intent_state.freezed.dart';

// ─────────────────────────────────────────────────────────────────────────────
// MOTOR INTENT STATE — Intent-to-Act pattern
// IDLE → PENDING (user taps) → ACTIVE (server confirmed) or ERROR
// Timeout: AppDurations.intentTimeout (10s) if server doesn't respond
// ─────────────────────────────────────────────────────────────────────────────

@freezed
class MotorIntentState with _$MotorIntentState {
  // No pending action — reflects current server state
  const factory MotorIntentState.idle({
    required String motorId,     // 'oht' | 'ugt'
    required bool isRunning,     // current server-reported state
  }) = _MotorIdle;

  // User tapped — waiting for server confirmation
  const factory MotorIntentState.pending({
    required String motorId,
    required bool isRunning,     // current state (what we're switching away from)
    required String pendingAction, // 'ON' | 'OFF'
  }) = _MotorPending;

  // Server confirmed the action
  const factory MotorIntentState.active({
    required String motorId,
    required bool isRunning,     // new confirmed state
  }) = _MotorActive;

  // Server rejected or timed out
  const factory MotorIntentState.error({
    required String motorId,
    required bool isRunning,     // rolled back to previous state
    required String message,
  }) = _MotorError;
}
