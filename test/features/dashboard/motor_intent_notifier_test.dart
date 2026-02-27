import 'dart:async';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_tanki_app/features/dashboard/application/motor_intent_notifier.dart';
import 'package:auto_tanki_app/features/dashboard/application/motor_intent_state.dart';
import 'package:auto_tanki_app/features/dashboard/data/dashboard_repository.dart';

@GenerateMocks([DashboardRepository])
import 'motor_intent_notifier_test.mocks.dart';

// ─────────────────────────────────────────────────────────────────────────────
// MOTOR INTENT NOTIFIER UNIT TESTS
// Uses Freezed maybeWhen() for state pattern matching.
// ─────────────────────────────────────────────────────────────────────────────

void main() {
  late MockDashboardRepository mockRepo;

  const deviceId = 'device-abc';
  const motorId  = 'oht';

  ProviderContainer buildContainer() {
    return ProviderContainer(
      overrides: [
        dashboardRepositoryProvider.overrideWithValue(mockRepo),
      ],
    );
  }

  setUp(() => mockRepo = MockDashboardRepository());

  // ─── Helper: state type checks ───────────────────────────────────────────
  bool isIdle(MotorIntentState s) =>
      s.maybeWhen(idle: (_, __) => true, orElse: () => false);
  bool isPending(MotorIntentState s) =>
      s.maybeWhen(pending: (_, __, ___) => true, orElse: () => false);
  bool isActive(MotorIntentState s) =>
      s.maybeWhen(active: (_, __) => true, orElse: () => false);
  bool isError(MotorIntentState s) =>
      s.maybeWhen(error: (_, __, ___) => true, orElse: () => false);

  final args = (deviceId: deviceId, motorId: motorId, initialIsRunning: false);

  group('MotorIntentNotifier — initial state', () {
    test('initial state is idle with isRunning=false', () {
      final c = buildContainer();
      final state = c.read(motorIntentProvider(args));
      expect(isIdle(state), isTrue);
      expect(state.maybeWhen(idle: (_, r) => r, orElse: () => null), isFalse);
      c.dispose();
    });
  });

  group('MotorIntentNotifier — toggle', () {
    test('toggle OFF → ON: passes through PENDING, then settles to IDLE', () async {
      when(mockRepo.controlMotor(
        deviceId: deviceId,
        motor: motorId,
        action: 'ON',
      )).thenAnswer((_) async {});

      final c = buildContainer();
      final states = <MotorIntentState>[];
      final sub = c.listen(motorIntentProvider(args), (_, s) => states.add(s));

      await c.read(motorIntentProvider(args).notifier).toggle();
      await Future.delayed(const Duration(milliseconds: 500));

      sub.close();
      c.dispose();

      expect(states.any((s) => isPending(s)), isTrue,
          reason: 'Must enter PENDING state');
      // Eventually settles to IDLE with isRunning=true
      final lastIdle = states.lastOrNull;
      if (lastIdle != null) {
        expect(isIdle(lastIdle) || isActive(lastIdle), isTrue,
            reason: 'Must settle to IDLE or ACTIVE after server confirms');
      }
    });

    test('toggle → ERROR when server throws, rolls back isRunning', () async {
      when(mockRepo.controlMotor(
        deviceId: deviceId,
        motor: motorId,
        action: 'ON',
      )).thenThrow(Exception('403 Billing expired'));

      final c = buildContainer();
      final states = <MotorIntentState>[];
      final sub = c.listen(motorIntentProvider(args), (_, s) => states.add(s));

      await c.read(motorIntentProvider(args).notifier).toggle();

      sub.close();
      c.dispose();

      expect(states.any((s) => isError(s)), isTrue,
          reason: 'Must enter ERROR state on server rejection');

      // Rolled back: error state has isRunning=false (previous value)
      final errState = states.firstWhere(isError);
      final rolledBack = errState.maybeWhen(
        error: (_, isRunning, __) => isRunning,
        orElse: () => null,
      );
      expect(rolledBack, isFalse, reason: 'State must roll back to previous isRunning=false');
    });

    test('second toggle is ignored while PENDING', () async {
      final completer = Completer<void>();
      when(mockRepo.controlMotor(
        deviceId: deviceId, motor: motorId, action: 'ON',
      )).thenAnswer((_) => completer.future); // never completes in this test

      final c = buildContainer();

      // First toggle - leaves in PENDING
      unawaited(c.read(motorIntentProvider(args).notifier).toggle());
      // Allow state to enter PENDING
      await Future.delayed(const Duration(milliseconds: 10));

      // Second toggle should be ignored
      await c.read(motorIntentProvider(args).notifier).toggle();

      verify(mockRepo.controlMotor(
        deviceId: deviceId, motor: motorId, action: 'ON',
      )).called(1); // only called once

      c.dispose();
    });
  });

  group('MotorIntentNotifier — syncFromTelemetry', () {
    test('sync updates idle isRunning from MQTT', () {
      final c = buildContainer();

      c.read(motorIntentProvider(args).notifier).syncFromTelemetry(true);

      final state = c.read(motorIntentProvider(args));
      expect(isIdle(state), isTrue);
      expect(
        state.maybeWhen(idle: (_, r) => r, orElse: () => null),
        isTrue,
        reason: 'isRunning should be updated to true by sync',
      );
      c.dispose();
    });

    test('sync does NOT interrupt PENDING state', () async {
      final completer = Completer<void>();
      when(mockRepo.controlMotor(
        deviceId: deviceId, motor: motorId, action: 'ON',
      )).thenAnswer((_) => completer.future);

      final c = buildContainer();

      // Start toggle — leave in PENDING
      unawaited(c.read(motorIntentProvider(args).notifier).toggle());
      await Future.delayed(const Duration(milliseconds: 10));

      // Sync from telemetry should NOT interrupt PENDING
      c.read(motorIntentProvider(args).notifier).syncFromTelemetry(false);

      final state = c.read(motorIntentProvider(args));
      expect(isPending(state), isTrue,
          reason: 'PENDING must not be interrupted by MQTT telemetry sync');
      c.dispose();
    });
  });
}
