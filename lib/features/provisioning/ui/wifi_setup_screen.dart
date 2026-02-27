import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/design_tokens.dart';
import '../../../core/theme/app_decorations.dart';
import '../../../core/utils/haptics.dart';
import '../../../shared/widgets/grid_background.dart';
import '../../../shared/utils/debounce_guard.dart';
import '../application/provisioning_notifier.dart';
import '../application/provisioning_state.dart';
import 'scan_qr_screen.dart' show StepIndicator;

// ─────────────────────────────────────────────────────────────────────────────
// STEP 3: WIFI SETUP SCREEN
// Collects SSID + Password, sends via BLE to firmware.
// WiFi password NEVER stored or logged — only in-memory for BLE write.
// ─────────────────────────────────────────────────────────────────────────────

class WifiSetupScreen extends ConsumerStatefulWidget {
  const WifiSetupScreen({super.key});

  @override
  ConsumerState<WifiSetupScreen> createState() => _WifiSetupScreenState();
}

class _WifiSetupScreenState extends ConsumerState<WifiSetupScreen>
    with SubmitDebounce {
  final _formKey    = GlobalKey<FormState>();
  final _ssidCtrl   = TextEditingController();
  final _passCtrl   = TextEditingController();
  bool _obscurePass = true;

  @override
  void dispose() {
    // Explicitly clear controllers — WiFi password must not linger in memory
    _ssidCtrl.clear();
    _passCtrl.clear();
    _ssidCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  Future<void> _onSubmit() async {
    if (!canSubmit) return;
    if (!(_formKey.currentState?.validate() ?? false)) return;
    await AppHaptics.light();

    await ref.read(provisioningNotifierProvider.notifier).sendWifiCredentials(
          ssid: _ssidCtrl.text.trim(),
          password: _passCtrl.text,
        );

    // Clear password from memory immediately after sending
    _passCtrl.clear();
  }

  @override
  Widget build(BuildContext context) {
    final provState = ref.watch(provisioningNotifierProvider);
    final isSending = provState.maybeWhen(
      sendingWifi: () => true,
      claimingDevice: (_) => true,
      orElse: () => false,
    );

    ref.listen<ProvisioningState>(provisioningNotifierProvider, (_, next) {
      next.whenOrNull(
        complete: (_, __) => context.go('/provisioning/finalizing'),
        error: (msg, step) {
          if (step == ProvisioningStep.wifiSend ||
              step == ProvisioningStep.claim) {
            resetDebounce();
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(msg)));
          }
        },
      );
    });

    return Scaffold(
      backgroundColor: AppColors.bgDark,
      body: GridBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Spacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back,
                          color: AppColors.textPrimary),
                      onPressed: () => context.go('/provisioning/ble'),
                    ),
                    Text('Add Device',
                        style: Theme.of(context).textTheme.titleLarge),
                  ],
                ),

                const SizedBox(height: Spacing.md),
                StepIndicator(currentStep: 2),
                const SizedBox(height: Spacing.xl),

                Text(
                  'Connect to Wi-Fi',
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: Spacing.xs),
                Text(
                  'Your device will connect to your home Wi-Fi.\nUse 2.4 GHz — 5 GHz is not currently supported.',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: Spacing.xl),

                // ── WiFi Form ──────────────────────────────────────────────
                Container(
                  decoration: AppDecorations.surfaceCard(),
                  padding: const EdgeInsets.all(Spacing.lg),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // SSID
                        TextFormField(
                          controller: _ssidCtrl,
                          textInputAction: TextInputAction.next,
                          style: const TextStyle(color: AppColors.textPrimary),
                          decoration: AppDecorations.inputDecoration(
                            label: 'Wi-Fi Network Name (SSID)',
                            icon: Icons.wifi,
                          ),
                          validator: (v) =>
                              (v == null || v.trim().isEmpty)
                                  ? 'Wi-Fi নাম প্রয়োজন'
                                  : null,
                        ),
                        const SizedBox(height: Spacing.md),

                        // Password
                        TextFormField(
                          controller: _passCtrl,
                          obscureText: _obscurePass,
                          textInputAction: TextInputAction.done,
                          onFieldSubmitted: (_) => _onSubmit(),
                          style: const TextStyle(color: AppColors.textPrimary),
                          decoration: AppDecorations.inputDecoration(
                            label: 'Wi-Fi Password',
                            icon: Icons.lock_outline,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePass
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: AppColors.textTertiary,
                              ),
                              onPressed: () => setState(
                                  () => _obscurePass = !_obscurePass),
                            ),
                          ),
                          validator: (v) =>
                              (v == null || v.isEmpty)
                                  ? 'পাসওয়ার্ড প্রয়োজন'
                                  : null,
                        ),
                        const SizedBox(height: Spacing.xs),

                        // Privacy note
                        Row(
                          children: [
                            const Icon(Icons.lock,
                                size: 12, color: AppColors.textTertiary),
                            const SizedBox(width: Spacing.xs),
                            Text(
                              'Password is sent directly to your device via Bluetooth. '
                              'It is never stored or transmitted to our servers.',
                              style: TextStyle(
                                color: AppColors.textTertiary,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),

                // Submit
                if (isSending)
                  _SendingIndicator(state: provState)
                else
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [AppShadows.primaryGlow],
                      borderRadius: BorderRadius.circular(AppRadius.md),
                    ),
                    child: ElevatedButton(
                      onPressed: _onSubmit,
                      child: const Text('Connect Device'),
                    ),
                  ),
                const SizedBox(height: Spacing.xl),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SendingIndicator extends StatelessWidget {
  final ProvisioningState state;
  const _SendingIndicator({required this.state});

  @override
  Widget build(BuildContext context) {
    final msg = state.maybeWhen(
      claimingDevice: (_) => 'Registering device to your account...',
      orElse: () => 'Sending Wi-Fi credentials to device...',
    );
    return Column(
      children: [
        const LinearProgressIndicator(
          color: AppColors.primary,
          backgroundColor: AppColors.surfaceHighlight,
        ),
        const SizedBox(height: Spacing.sm),
        Text(msg, style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center),
      ],
    );
  }
}
