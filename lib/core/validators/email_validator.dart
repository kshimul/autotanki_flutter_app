// ─────────────────────────────────────────────────────────────────────────────
// EMAIL VALIDATOR
// Validates format + domain whitelist for registration screen.
// Returns null if valid, error string if invalid.
// ─────────────────────────────────────────────────────────────────────────────

class EmailValidator {
  EmailValidator._();

  // Allowed consumer email domains.
  // The server enforces its own validation — this is a UX-layer guard only.
  static const List<String> _allowedDomains = [
    'gmail.com',
    'yahoo.com',
    'outlook.com',
    'hotmail.com',
    'icloud.com',
    'protonmail.com',
    'zoho.com',
    'live.com',
    'msn.com',
  ];

  // Disposable email domains to block
  static const List<String> _blockedDomains = [
    'mailinator.com',
    'guerrillamail.com',
    'tempmail.com',
    'throwaway.email',
    'yopmail.com',
    'sharklasers.com',
  ];

  // RFC 5321-compliant regex that handles subdomains (e.g. user@mail.company.com)
  static final _emailRegex = RegExp(r'^[\w\.\-]+@([\w\-]+\.)+[a-zA-Z]{2,}$');

  static String? validate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'ইমেইল প্রয়োজন'; // Email is required
    }

    final trimmed = value.trim().toLowerCase();

    if (!_emailRegex.hasMatch(trimmed)) {
      return 'সঠিক ইমেইল ফরম্যাট লিখুন'; // Enter a valid email format
    }

    final parts = trimmed.split('@');
    if (parts.length != 2) {
      return 'সঠিক ইমেইল ফরম্যাট লিখুন';
    }

    final domain = parts[1];

    if (_blockedDomains.contains(domain)) {
      return 'এই ইমেইল প্রোভাইডার অনুমোদিত নয়'; // Disposable email not allowed
    }

    if (!_allowedDomains.contains(domain)) {
      return 'অনুগ্রহ করে Gmail, Outlook বা পরিচিত প্রোভাইডার ব্যবহার করুন';
    }

    return null; // Valid
  }
}
