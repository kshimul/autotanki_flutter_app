// ─────────────────────────────────────────────────────────────────────────────
// SUBMIT DEBOUNCE MIXIN
// Prevents rapid form submission or double-tap on buttons.
// Mixes into State classes. Duration is configurable per screen.
//
// Usage:
//   class _LoginScreenState extends State<LoginScreen> with SubmitDebounce {
//     Future<void> _onSubmit() async {
//       if (!canSubmit) return;  // Blocks if called within debounceDuration
//       // ... submit logic
//     }
//   }
// ─────────────────────────────────────────────────────────────────────────────

import '../../core/theme/design_tokens.dart';

mixin SubmitDebounce {
  /// Override to customize debounce per screen (default: 2s from AppDurations)
  Duration get debounceDuration => AppDurations.debounceDefault;

  DateTime? _lastSubmit;

  /// Returns true if enough time has passed since last submit.
  /// Calling this automatically records the submit timestamp.
  bool get canSubmit {
    final now = DateTime.now();
    if (_lastSubmit != null &&
        now.difference(_lastSubmit!) < debounceDuration) {
      return false;
    }
    _lastSubmit = now;
    return true;
  }

  /// Manually reset the debounce (e.g., after a server error to allow retry)
  void resetDebounce() => _lastSubmit = null;
}
