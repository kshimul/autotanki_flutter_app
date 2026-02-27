import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'route_names.dart';
import '../../features/auth/application/auth_notifier.dart';
import '../../features/auth/ui/login_screen.dart';
import '../../features/auth/ui/register_screen.dart';
import '../../features/auth/ui/forgot_password_screen.dart';
import '../../features/provisioning/ui/scan_qr_screen.dart';
import '../../features/provisioning/ui/ble_search_screen.dart';
import '../../features/provisioning/ui/wifi_setup_screen.dart';
import '../../features/provisioning/ui/finalizing_screen.dart';
import '../../features/dashboard/ui/dashboard_screen.dart';
import '../../features/dashboard/application/dashboard_providers.dart';
import '../../features/insight/ui/insight_screen.dart';
import '../../features/schedule/ui/schedule_screen.dart';
import '../../features/billing/ui/billing_screen.dart';
import '../../features/settings/ui/settings_screen.dart';
import '../ui/splash_screen.dart';

// ─────────────────────────────────────────────────────────────────────────────
// APP ROUTER (GoRouter)
// ─────────────────────────────────────────────────────────────────────────────

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/splash', // Splash waits for auth to resolve
    debugLogDiagnostics: true,
    redirect: (context, state) => null,
    routes: [
      // ─── Splash — shows while auth initialises ─────────────────────────────
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: RouteNames.login,
        name: 'login',
        builder: (context, state) => const LoginScreen(),
        redirect: (context, state) {
          // Guest-only: redirect to dashboard if already authenticated
          final authState = ProviderScope.containerOf(context).read(authNotifierProvider);
          final isAuthed = authState.maybeWhen(authenticated: (_) => true, orElse: () => false);
          if (isAuthed) return RouteNames.dashboard;
          return null;
        },
      ),
      GoRoute(
        path: RouteNames.register,
        name: 'register',
        builder: (context, state) => const RegisterScreen(),
        redirect: (context, state) {
          final authState = ProviderScope.containerOf(context).read(authNotifierProvider);
          final isAuthed = authState.maybeWhen(authenticated: (_) => true, orElse: () => false);
          if (isAuthed) return RouteNames.dashboard;
          return null;
        },
      ),
      GoRoute(
        path: '/forgot-password',
        name: 'forgotPassword',
        builder: (context, state) => const ForgotPasswordScreen(),
      ),

      // ─── Main Shell (protected, with bottom nav) ───────────────────────────
      ShellRoute(
        builder: (context, state, child) => _MainShell(child: child),
        routes: [
          GoRoute(
            path: RouteNames.dashboard,
            name: 'dashboard',
            builder: (context, state) => const DashboardScreen(),
            redirect: (context, state) {
              // Auth guard: do NOT redirect during initial state (async resolving)
              final authState = ProviderScope.containerOf(context).read(authNotifierProvider);
              final isInitial = authState.maybeWhen(initial: () => true, orElse: () => false);
              if (isInitial) return '/splash'; // still loading — go back to splash
              final isUnauthed = authState.maybeWhen(unauthenticated: () => true, orElse: () => false);
              if (isUnauthed) return RouteNames.login;
              // Load devices when landing on dashboard
              ProviderScope.containerOf(context)
                  .read(deviceSelectorProvider.notifier)
                  .loadDevices();
              return null;
            },
          ),
          GoRoute(
            path: RouteNames.insight,
            name: 'insight',
            builder: (context, state) => const InsightScreen(),
          ),
          GoRoute(
            path: RouteNames.schedules,
            name: 'schedules',
            builder: (context, state) => const ScheduleScreen(),
          ),
          GoRoute(
            path: RouteNames.billing,
            name: 'billing',
            builder: (context, state) => const BillingScreen(),
          ),
          GoRoute(
            path: RouteNames.settings,
            name: 'settings',
            builder: (context, state) => const SettingsScreen(),
          ),
        ],
      ),

      // ─── Provisioning (wizard, no bottom nav) ─────────────────────────────
      GoRoute(
        path: RouteNames.provisioningRoot,
        name: 'provisioning',
        redirect: (_, __) => RouteNames.scanQr,
        routes: [
          GoRoute(
            path: 'scan',
            name: 'scanQr',
            builder: (context, state) => const ScanQrScreen(),
          ),
          GoRoute(
            path: 'ble',
            name: 'bleSearch',
            builder: (context, state) => const BleSearchScreen(),
          ),
          GoRoute(
            path: 'wifi',
            name: 'wifiSetup',
            builder: (context, state) => const WifiSetupScreen(),
          ),
          GoRoute(
            path: 'finalizing',
            name: 'finalizing',
            builder: (context, state) => const FinalizingScreen(),
          ),
        ],
      ),
    ],
  );
});

// ─────────────────────────────────────────────────────────────────────────────
// MAIN SHELL — Bottom navigation bar
// ─────────────────────────────────────────────────────────────────────────────

class _MainShell extends StatelessWidget {
  final Widget child;
  const _MainShell({required this.child});

  static const _tabs = [
    (icon: Icons.home_outlined, activeIcon: Icons.home, label: 'Home', route: RouteNames.dashboard),
    (icon: Icons.bar_chart_outlined, activeIcon: Icons.bar_chart, label: 'Insights', route: RouteNames.insight),
    (icon: Icons.calendar_month_outlined, activeIcon: Icons.calendar_month, label: 'Schedule', route: RouteNames.schedules),
    (icon: Icons.payments_outlined, activeIcon: Icons.payments, label: 'Billing', route: RouteNames.billing),
    (icon: Icons.settings_outlined, activeIcon: Icons.settings, label: 'Settings', route: RouteNames.settings),
  ];

  int _currentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    for (var i = 0; i < _tabs.length; i++) {
      if (location.startsWith(_tabs[i].route)) return i;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = _currentIndex(context);
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => context.go(_tabs[index].route),
        items: _tabs
            .map((tab) => BottomNavigationBarItem(
                  icon: Icon(tab.icon),
                  activeIcon: Icon(tab.activeIcon),
                  label: tab.label,
                ))
            .toList(),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// PLACEHOLDER SCREEN — Removed as each feature screen is implemented
// ─────────────────────────────────────────────────────────────────────────────

class _PlaceholderScreen extends StatelessWidget {
  final String title;
  const _PlaceholderScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text(title, style: Theme.of(context).textTheme.titleLarge),
      ),
    );
  }
}
