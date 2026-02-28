// ─────────────────────────────────────────────────────────────────────────────
// API CONSTANTS
// All backend endpoint paths. Must match Swagger spec exactly.
// Validated against v3.1 API cross-check (55 endpoints).
// ─────────────────────────────────────────────────────────────────────────────

class ApiConstants {
  ApiConstants._();

  // ─── Auth ──────────────────────────────────────────────────────────────────
  static const String register      = '/api/v1/auth/register';
  static const String login         = '/api/v1/auth/login';
  static const String refresh       = '/api/v1/auth/refresh';
  static const String logout        = '/api/v1/auth/logout';
  static const String me            = '/api/v1/auth/me';
  static const String fcmToken      = '/api/v1/auth/fcm-token'; // POST + DELETE
  static const String forgotPassword  = '/api/v1/auth/forgot-password';
  static const String resetPassword   = '/api/v1/auth/reset-password';

  // ─── Devices ───────────────────────────────────────────────────────────────
  static const String dashboard        = '/api/v1/dashboard';
  static const String devices          = '/api/v1/devices';
  static const String claimDevice      = '/api/v1/devices/claim';
  static const String sharedWithMe     = '/api/v1/devices/shared-with-me';
  static String deviceById(String id)  => '/api/v1/devices/$id';
  static String deviceShares(String id) => '/api/v1/devices/$id/shares';

  // Motor: motor param is "oht" (overhead) or "ugt" (underground)
  static String motorControl(String deviceId, String motor) =>
      '/api/v1/devices/$deviceId/motor/$motor/control';

  static String motorConfig(String deviceId, String motor) =>
      '/api/v1/devices/$deviceId/motor/$motor/config';

  static String deviceSettings(String id) => '/api/v1/devices/$id/settings';
  static String telemetry(String id)     => '/api/v1/devices/$id/telemetry';

  // ─── Subscriptions ─────────────────────────────────────────────────────────
  static const String subscriptions         = '/api/v1/subscriptions';
  static const String subscriptionPackages  = '/api/v1/subscriptions/packages';
  static String packageById(String id)      => '/api/v1/subscriptions/packages/$id';
  static String subscriptionById(String id) => '/api/v1/subscriptions/$id';
  static String invoiceById(String id)      => '/api/v1/subscriptions/invoices/$id';

  // ─── Payments ──────────────────────────────────────────────────────────────
  static const String subscribe      = '/api/v1/payments/subscribe';
  static const String paymentGateways = '/api/v1/payments/gateways'; // GET enabled gateways
  static String paymentById(String id) => '/api/v1/payments/$id';

  // ─── Support ───────────────────────────────────────────────────────────────
  static const String tickets        = '/api/v1/support/tickets';
  static String ticketById(String id) => '/api/v1/support/tickets/$id';

  // ─── Schedules ─────────────────────────────────────────────────────────────
  static String schedules(String id)      => '/api/v1/devices/$id/schedules';
  static String scheduleById(String deviceId, String scheduleId) => '/api/v1/devices/$deviceId/schedules/$scheduleId';

  // ─── User / Profile ────────────────────────────────────────────────────────
  static const String profile        = '/api/v1/auth/profile';        // GET/PATCH
  static const String changePassword = '/api/v1/auth/change-password'; // POST

  // ─── Tank / Device Config ──────────────────────────────────────────────────
  static const String tankTypes = '/api/v1/devices/tank-types'; // GET predefined sizes
  static String tankConfig(String id) => '/api/v1/devices/$id/tank'; // alias for PUT tank settings

  // ─── Device Shares ─────────────────────────────────────────────────────────
  static String deviceShareById(String deviceId, String shareId) =>
      '/api/v1/devices/$deviceId/shares/$shareId'; // DELETE

  // ─── Support (alias matching repository usage) ─────────────────────────────
  static const String supportTickets = '/api/v1/support/tickets'; // GET list / POST new
}
