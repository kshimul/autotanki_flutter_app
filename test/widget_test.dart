// ─────────────────────────────────────────────────────────────────────────────
// SMOKE TEST — SmartTankApp boots without throwing
// NOTE: This is limited since Firebase.initializeApp() cannot run in unit test.
// Full integration tests require a connected device/emulator.
// We simply verify that the validators and unit logic compile & execute.
// ─────────────────────────────────────────────────────────────────────────────

// ignore_for_file: unused_import
import 'package:flutter_test/flutter_test.dart';
import 'package:auto_tanki_app/core/validators/email_validator.dart';

void main() {
  group('SmartTank — smoke tests (no Firebase required)', () {
    test('EmailValidator correctly validates known-good gmail', () {
      expect(EmailValidator.validate('admin@gmail.com'), isNull);
    });

    test('EmailValidator blocks disposable domains', () {
      expect(EmailValidator.validate('test@mailinator.com'), isNotNull);
    });

    test('EmailValidator fails on empty input', () {
      expect(EmailValidator.validate(''), isNotNull);
    });
  });
}
