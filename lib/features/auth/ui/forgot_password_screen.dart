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

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState
    extends ConsumerState<ForgotPasswordScreen> with SubmitDebounce {
  final _formKey   = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  bool _sent       = false;

  @override
  void dispose() {
    _emailCtrl.dispose();
    super.dispose();
  }

  Future<void> _onSubmit() async {
    if (!canSubmit) return;
    if (!(_formKey.currentState?.validate() ?? false)) return;
    await AppHaptics.light();

    final success = await ref
        .read(authNotifierProvider.notifier)
        .forgotPassword(_emailCtrl.text.trim());

    if (success && mounted) {
      setState(() => _sent = true);
    } else if (mounted) {
      resetDebounce();
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);
    final isLoading = authState.maybeWhen(loading: () => true, orElse: () => false);

    return Scaffold(
      backgroundColor: AppColors.bgDark,
      body: MeshGradientBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Spacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: Spacing.lg),
                // Back button
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back,
                        color: AppColors.textPrimary),
                    onPressed: () => context.pop(),
                  ),
                ),
                const Spacer(),

                Container(
                  decoration: AppDecorations.frostedCard(),
                  padding: const EdgeInsets.all(Spacing.lg),
                  child: _sent ? _SuccessView() : _FormView(
                    formKey: _formKey,
                    emailCtrl: _emailCtrl,
                    isLoading: isLoading,
                    onSubmit: _onSubmit,
                  ),
                ),

                const Spacer(flex: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FormView extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailCtrl;
  final bool isLoading;
  final VoidCallback onSubmit;

  const _FormView({
    required this.formKey,
    required this.emailCtrl,
    required this.isLoading,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(Icons.lock_reset, color: AppColors.primary, size: 40),
          const SizedBox(height: Spacing.md),
          Text('Forgot Password',
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center),
          const SizedBox(height: Spacing.xs),
          Text(
            'Enter your email and we\'ll send a reset link.',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: Spacing.lg),
          TextFormField(
            controller: emailCtrl,
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(color: AppColors.textPrimary),
            decoration: AppDecorations.inputDecoration(
              label: 'Email',
              icon: Icons.email_outlined,
            ),
            validator: EmailValidator.validate,
          ),
          const SizedBox(height: Spacing.lg),
          Container(
            decoration: BoxDecoration(
              boxShadow: [AppShadows.primaryGlow],
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
            child: ElevatedButton(
              onPressed: isLoading ? null : onSubmit,
              child: isLoading
                  ? const SizedBox(
                      height: 20, width: 20,
                      child: CircularProgressIndicator(
                          strokeWidth: 2, color: Colors.white))
                  : const Text('Send Reset Link'),
            ),
          ),
        ],
      ),
    );
  }
}

class _SuccessView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(Icons.mark_email_read_outlined,
            color: AppColors.success, size: 48),
        const SizedBox(height: Spacing.md),
        Text('Check your email',
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center),
        const SizedBox(height: Spacing.sm),
        Text(
          'We\'ve sent a password reset link to your email address.',
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: Spacing.lg),
        TextButton(
          onPressed: () => context.go('/login'),
          child: Text('Back to Sign In',
              style: TextStyle(color: AppColors.primary,
                  fontWeight: FontWeight.w700)),
        ),
      ],
    );
  }
}
