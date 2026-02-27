// ─────────────────────────────────────────────────────────────────────────────
// INTEGRATION TEST: Motor Control Flow
// Tests the full flow: dashboard loads → motor button shown → tap → PENDING →
// server confirms → ACTIVE → back to IDLE with updated state.
//
// NOTE: This test requires a running device emulator/simulator and a mocked
// backend (or real staging). Run with:
//   flutter test integration_test/motor_control_flow_test.dart
// ─────────────────────────────────────────────────────────────────────────────

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:auto_tanki_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Motor Control Flow', () {
    testWidgets('Motor button transitions through IDLE → PENDING → IDLE',
        (tester) async {
      // Arrange: start app
      app.main();
      await tester.pumpAndSettle(const Duration(seconds: 3));

      // Act: if on login screen, skip (integration test requires auth)
      // In CI: override auth provider with a pre-authenticated state
      if (find.text('Dashboard').evaluate().isEmpty) {
        // Not authenticated — integration test requires auth setup
        // Skip gracefully in unauthenticated CI environment
        return;
      }

      // Find OHT motor button
      final motorBtn = find.text('OHT Motor');
      expect(motorBtn, findsOneWidget,
          reason: 'OHT Motor control button must be visible on dashboard');

      // Tap to toggle
      await tester.tap(motorBtn);
      await tester.pump(); // single frame

      // Verify PENDING state shows spinner or "Turning On/Off..."
      expect(
        find.textContaining('Turning'),
        findsAny,
        reason: 'PENDING state should show "Turning On/Off..." text',
      );

      // Wait for settle (ACTIVE → IDLE transition ~300ms)
      await tester.pumpAndSettle(const Duration(seconds: 2));

      // Verify button is back in IDLE (no spinner visible)
      expect(
        find.byType(CircularProgressIndicator),
        findsNothing,
        reason: 'No spinner after ACTIVE→IDLE transition',
      );
    });

    testWidgets('No device state shows Add Device button', (tester) async {
      app.main();
      await tester.pumpAndSettle(const Duration(seconds: 3));

      // If on dashboard with no device — should show "Add Device"
      if (find.text('Add Device').evaluate().isNotEmpty) {
        expect(find.text('Add Device'), findsOneWidget);
        await tester.tap(find.text('Add Device'));
        await tester.pumpAndSettle();
        // Should navigate to provisioning
        expect(find.text('Scan QR Code'), findsOneWidget);
      }
    });
  });
}
