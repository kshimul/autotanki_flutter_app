import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/design_tokens.dart';
import '../../../core/theme/app_decorations.dart';
import '../../../core/validators/email_validator.dart';
import '../../../core/utils/haptics.dart';
import '../../../shared/widgets/grid_background.dart';
import '../../../shared/utils/debounce_guard.dart';
import '../application/auth_notifier.dart';
import '../application/auth_state.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen>
    with SubmitDebounce {
  final _formKey  = GlobalKey<FormState>();
  final _emailCtrl    = TextEditingController();
  final _passwordCtrl = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  Future<void> _onSubmit() async {
    if (!canSubmit) return;
    if (!(_formKey.currentState?.validate() ?? false)) return;
    await AppHaptics.medium();

    await ref.read(authNotifierProvider.notifier).login(
          email: _emailCtrl.text.trim(),
          password: _passwordCtrl.text,
        );
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);
    final isLoading = authState.maybeWhen(loading: () => true, orElse: () => false);

    // Navigate to dashboard on success
    ref.listen<AuthState>(authNotifierProvider, (_, next) {
      next.maybeWhen(
        authenticated: (_) => context.go('/dashboard'),
        error: (msg) {
          resetDebounce();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(msg)),
          );
        },
        orElse: () {},
      );
    });

    return Scaffold(
      backgroundColor: AppColors.bgDark,
      body: MeshGradientBackground(
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: Spacing.lg),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ── Logo / Header ──────────────────────────────────────
                  const Icon(
                    Icons.water_drop,
                    color: AppColors.primary,
                    size: 48,
                  ),
                  const SizedBox(height: Spacing.md),
                  Text(
                    'SmartTank',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  const SizedBox(height: Spacing.xs),
                  Text(
                    'Smart water. Smarter living.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: Spacing.xl),

                  // ── Frosted glass card ────────────────────────────────
                  Container(
                    decoration: AppDecorations.frostedCard(),
                    child: Padding(
                      padding: const EdgeInsets.all(Spacing.lg),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Welcome back',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: Spacing.xs),
                            Text(
                              'Sign in to your account',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(height: Spacing.lg),

                            // Email
                            TextFormField(
                              controller: _emailCtrl,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              style: const TextStyle(color: AppColors.textPrimary),
                              decoration: AppDecorations.inputDecoration(
                                label: 'Email',
                                icon: Icons.email_outlined,
                              ),
                              validator: EmailValidator.validate,
                            ),
                            const SizedBox(height: Spacing.md),

                            // Password
                            TextFormField(
                              controller: _passwordCtrl,
                              obscureText: _obscurePassword,
                              textInputAction: TextInputAction.done,
                              onFieldSubmitted: (_) => _onSubmit(),
                              style: const TextStyle(color: AppColors.textPrimary),
                              decoration: AppDecorations.inputDecoration(
                                label: 'Password',
                                icon: Icons.lock_outline,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscurePassword
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: AppColors.textTertiary,
                                  ),
                                  onPressed: () => setState(
                                      () => _obscurePassword = !_obscurePassword),
                                ),
                              ),
                              validator: (v) => (v == null || v.length < 6)
                                  ? 'পাসওয়ার্ড কমপক্ষে ৬ অক্ষর হতে হবে'
                                  : null,
                            ),
                            const SizedBox(height: Spacing.sm),

                            // Forgot password
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () => context.push('/forgot-password'),
                                child: Text(
                                  'Forgot password?',
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: Spacing.md),

                            // Submit button
                            Container(
                              decoration: BoxDecoration(
                                boxShadow: [AppShadows.primaryGlow],
                                borderRadius: BorderRadius.circular(AppRadius.md),
                              ),
                              child: ElevatedButton(
                                onPressed: isLoading ? null : _onSubmit,
                                child: isLoading
                                    ? const SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          color: Colors.white,
                                        ),
                                      )
                                    : const Text('Sign In'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: Spacing.lg),

                  // Register link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      GestureDetector(
                        onTap: () => context.go('/register'),
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
