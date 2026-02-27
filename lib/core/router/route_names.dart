// ─────────────────────────────────────────────────────────────────────────────
// ROUTE NAMES — Single source of truth for all named routes
// ─────────────────────────────────────────────────────────────────────────────

class RouteNames {
  RouteNames._();

  // ─── Auth ───────────────────────────────────────────────────────────────────
  static const login    = '/login';
  static const register = '/register';

  // ─── Main (protected) ───────────────────────────────────────────────────────
  static const home           = '/';
  static const dashboard      = '/dashboard';
  static const insight        = '/insight';
  static const schedules      = '/schedules';
  static const addSchedule    = '/schedules/add';
  static const billing        = '/billing';
  static const paymentWebView = '/billing/pay';
  static const settings       = '/settings';
  static const tankConfig     = '/settings/tank';

  // ─── Provisioning (wizard steps) ─────────────────────────────────────────
  static const provisioningRoot = '/provisioning';
  static const scanQr           = '/provisioning/scan';
  static const bleSearch        = '/provisioning/ble';
  static const wifiSetup        = '/provisioning/wifi';
  static const finalizing       = '/provisioning/finalizing';
}
