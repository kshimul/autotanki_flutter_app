import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/application/auth_notifier.dart';
import '../../features/auth/application/auth_state.dart';
import '../theme/design_tokens.dart';
import '../router/route_names.dart';

// ─────────────────────────────────────────────────────────────────────────────
// SPLASH SCREEN — Shows while AuthNotifier._checkExistingSession() resolves.
// Listens for the first non-initial auth state then redirects automatically.
// ─────────────────────────────────────────────────────────────────────────────

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _pulse;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _pulse = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
    _scale = Tween<double>(begin: 0.95, end: 1.05).animate(
      CurvedAnimation(parent: _pulse, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pulse.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // When auth state leaves `initial`, navigate accordingly
    ref.listen<AuthState>(authNotifierProvider, (_, next) {
      next.maybeWhen(
        initial: () {}, // still loading — do nothing
        authenticated: (_) => context.go(RouteNames.dashboard),
        orElse: () => context.go(RouteNames.login),
      );
    });

    return Scaffold(
      backgroundColor: AppColors.bgDark,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animated logo mark
            ScaleTransition(
              scale: _scale,
              child: Container(
                width: 88,
                height: 88,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [AppColors.primary, AppColors.primaryDark],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [AppShadows.primaryGlow],
                ),
                child: const Icon(
                  Icons.water_drop,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'SmartTank',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 28,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Smart Water Controller',
              style: TextStyle(
                color: AppColors.textTertiary,
                fontSize: 13,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 48),
            SizedBox(
              width: 28,
              height: 28,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                color: AppColors.primary,
                backgroundColor: AppColors.surfaceHighlight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
