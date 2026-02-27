import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../core/theme/design_tokens.dart';
import '../../../core/theme/app_decorations.dart';
import '../../../core/validators/email_validator.dart';
import '../../../core/utils/haptics.dart';
import '../../../shared/widgets/grid_background.dart';
import '../../../shared/utils/debounce_guard.dart';
import '../application/auth_notifier.dart';
import '../application/auth_state.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen>
    with SubmitDebounce {
  final _formKey      = GlobalKey<FormState>();
  final _nameCtrl     = TextEditingController();
  final _emailCtrl    = TextEditingController();
  final _passwordCtrl = TextEditingController();
  bool _obscurePassword = true;
  String? _phoneNumber; // Set by IntlPhoneField (includes country code)

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  Future<void> _onSubmit() async {
    if (!canSubmit) return;
    if (!(_formKey.currentState?.validate() ?? false)) return;
    await AppHaptics.medium();

    await ref.read(authNotifierProvider.notifier).register(
          fullName: _nameCtrl.text.trim(),
          email: _emailCtrl.text.trim(),
          password: _passwordCtrl.text,
          phone: _phoneNumber,
        );
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);
    final isLoading = authState.maybeWhen(loading: () => true, orElse: () => false);

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
                  const Icon(Icons.water_drop, color: AppColors.primary, size: 48),
                  const SizedBox(height: Spacing.md),
                  Text(
                    'Create Account',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: Spacing.xs),
                  Text(
                    'Join SmartTank today',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: Spacing.xl),

                  Container(
                    decoration: AppDecorations.frostedCard(),
                    child: Padding(
                      padding: const EdgeInsets.all(Spacing.lg),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // Full Name
                            TextFormField(
                              controller: _nameCtrl,
                              textInputAction: TextInputAction.next,
                              textCapitalization: TextCapitalization.words,
                              style: const TextStyle(color: AppColors.textPrimary),
                              decoration: AppDecorations.inputDecoration(
                                label: 'Full Name',
                                icon: Icons.person_outline,
                              ),
                              validator: (v) => (v == null || v.trim().length < 2)
                                  ? 'পূর্ণ নাম লিখুন'
                                  : null,
                            ),
                            const SizedBox(height: Spacing.md),

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

                            // Phone (optional, with country code)
                            IntlPhoneField(
                              initialCountryCode: 'BD',
                              keyboardType: TextInputType.phone,
                              style: const TextStyle(color: AppColors.textPrimary),
                              dropdownTextStyle:
                                  const TextStyle(color: AppColors.textPrimary),
                              decoration: InputDecoration(
                                labelText: 'Phone (optional)',
                                labelStyle:
                                    const TextStyle(color: AppColors.textTertiary, fontSize: 12),
                                filled: true,
                                fillColor: AppColors.surfaceDark,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(AppRadius.md),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(AppRadius.md),
                                  borderSide: const BorderSide(
                                      color: AppColors.primary, width: 2),
                                ),
                              ),
                              onChanged: (phone) {
                                _phoneNumber = phone.completeNumber;
                              },
                              validator: (_) => null, // Optional field
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
                              validator: (v) {
                                if (v == null || v.isEmpty) return 'পাসওয়ার্ড দিন';
                                if (v.length < 8) return 'পাসওয়ার্ড কমপক্ষে ৮ অক্ষর';
                                return null;
                              },
                            ),
                            const SizedBox(height: Spacing.lg),

                            // Submit
                            Container(
                              decoration: BoxDecoration(
                                boxShadow: [AppShadows.primaryGlow],
                                borderRadius: BorderRadius.circular(AppRadius.md),
                              ),
                              child: ElevatedButton(
                                onPressed: isLoading ? null : _onSubmit,
                                child: isLoading
                                    ? const SizedBox(
                                        height: 20, width: 20,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2, color: Colors.white),
                                      )
                                    : const Text('Create Account'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: Spacing.lg),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account? ',
                          style: Theme.of(context).textTheme.bodyMedium),
                      GestureDetector(
                        onTap: () => context.go('/login'),
                        child: Text(
                          'Sign in',
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
