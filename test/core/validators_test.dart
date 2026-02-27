import 'package:flutter_test/flutter_test.dart';
import 'package:auto_tanki_app/core/validators/email_validator.dart';

// ─────────────────────────────────────────────────────────────────────────────
// CORE VALIDATORS UNIT TESTS
// EmailValidator has private constructor + static validate() method.
// ─────────────────────────────────────────────────────────────────────────────

void main() {
  group('EmailValidator.validate', () {
    test('valid gmail email passes', () {
      expect(EmailValidator.validate('user@gmail.com'), isNull);
    });

    test('valid outlook email passes', () {
      expect(EmailValidator.validate('user@outlook.com'), isNull);
    });

    test('valid yahoo email passes', () {
      expect(EmailValidator.validate('user.name@yahoo.com'), isNull);
    });

    test('empty email returns error', () {
      expect(EmailValidator.validate(''), isNotNull);
    });

    test('null email returns error', () {
      expect(EmailValidator.validate(null), isNotNull);
    });

    test('no @ sign returns error', () {
      expect(EmailValidator.validate('notanemail'), isNotNull);
    });

    test('missing domain returns error', () {
      expect(EmailValidator.validate('user@'), isNotNull);
    });

    test('double @ returns error', () {
      expect(EmailValidator.validate('user@@gmail.com'), isNotNull);
    });

    test('space in email returns error', () {
      expect(EmailValidator.validate('user @gmail.com'), isNotNull);
    });

    test('disposable email is blocked', () {
      expect(EmailValidator.validate('temp@mailinator.com'), isNotNull);
    });

    test('unknown domain returns error (whitelist enforced)', () {
      // sub.domain.org is RFC-valid email but not in allowed list
      expect(EmailValidator.validate('user@unknowndomain.net'), isNotNull);
    });
  });
}
