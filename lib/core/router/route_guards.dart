import 'package:flutter_riverpod/flutter_riverpod.dart';

// ─────────────────────────────────────────────────────────────────────────────
// ROUTE GUARDS
// Each guard returns null (allow) or a redirect path (block).
// ─────────────────────────────────────────────────────────────────────────────

// Placeholder providers — will be replaced with real auth/billing providers in Phase 2
final _isAuthenticatedProvider = Provider<bool>((ref) => false);
final _billingStatusProvider = Provider<String>((ref) => 'INACTIVE');
final _billingVerifiedAtProvider = Provider<DateTime>((ref) => DateTime(2000));

class RouteGuards {
  RouteGuards._();

  // ── Auth Guard ─────────────────────────────────────────────────────────────
  // Redirects to /login if user is not authenticated.
  static String? authGuard(WidgetRef ref) {
    final isAuthenticated = ref.read(_isAuthenticatedProvider);
    if (!isAuthenticated) return '/login';
    return null;
  }

  // ── Guest Guard ────────────────────────────────────────────────────────────
  // Redirects to /dashboard if user is already authenticated (prevents login loop).
  static String? guestGuard(WidgetRef ref) {
    final isAuthenticated = ref.read(_isAuthenticatedProvider);
    if (isAuthenticated) return '/dashboard';
    return null;
  }

  // ── Billing Guard ──────────────────────────────────────────────────────────
  // Redirects to /billing if subscription is not ACTIVE.
  // Freshness: if cached state is >5 minutes old, triggers server refresh
  // (prevents bypass via cached ACTIVE from expired subscription).
  static String? billingGuard(WidgetRef ref) {
    final status = ref.read(_billingStatusProvider);
    final verifiedAt = ref.read(_billingVerifiedAtProvider);

    // Trigger background freshness check if cache is stale
    final cacheAge = DateTime.now().difference(verifiedAt);
    if (cacheAge > const Duration(minutes: 5)) {
      // Async refresh — does not block navigation on first check
      // TODO: connect to billingNotifier.verifyFromServer() in Phase 5
    }

    if (status != 'ACTIVE') return '/billing';
    return null;
  }
}
