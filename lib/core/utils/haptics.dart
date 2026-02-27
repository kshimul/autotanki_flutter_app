import 'package:flutter/services.dart';

// ─────────────────────────────────────────────────────────────────────────────
// HAPTICS UTILITY
// Consistent haptic feedback patterns for motor controls, alerts, and taps.
// Uses Flutter's built-in HapticFeedback — no extra package needed.
// ─────────────────────────────────────────────────────────────────────────────

class AppHaptics {
  AppHaptics._();

  /// Selection tick — for toggle switches, tab changes
  static Future<void> selection() => HapticFeedback.selectionClick();

  /// Light tap — for card taps, nav items
  static Future<void> light() => HapticFeedback.lightImpact();

  /// Medium impact — for intent button confirmation
  static Future<void> medium() => HapticFeedback.mediumImpact();

  /// Heavy impact — for motor start confirmation
  static Future<void> heavy() => HapticFeedback.heavyImpact();

  /// Error pattern — double vibration for MQTT error/timeout
  static Future<void> error() async {
    await HapticFeedback.heavyImpact();
    await Future.delayed(const Duration(milliseconds: 100));
    await HapticFeedback.heavyImpact();
  }
}
