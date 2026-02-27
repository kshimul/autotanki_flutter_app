import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/design_tokens.dart';
import '../../../core/theme/app_decorations.dart';
import '../../../core/utils/haptics.dart';
import '../../../shared/widgets/grid_background.dart';
import '../application/provisioning_notifier.dart';
import 'scan_qr_screen.dart' show StepIndicator;

// ─────────────────────────────────────────────────────────────────────────────
// STEP 4: FINALIZING SCREEN — Provisioning complete
// ─────────────────────────────────────────────────────────────────────────────

class FinalizingScreen extends ConsumerStatefulWidget {
  const FinalizingScreen({super.key});

  @override
  ConsumerState<FinalizingScreen> createState() => _FinalizingScreenState();
}

class _FinalizingScreenState extends ConsumerState<FinalizingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: AppDurations.slow,
    );
    _scaleAnim = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    );
    _controller.forward();
    AppHaptics.heavy(); // Success haptic
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provState = ref.watch(provisioningNotifierProvider);

    return Scaffold(
      backgroundColor: AppColors.bgDark,
      body: GridBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Spacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: Spacing.lg),
                StepIndicator(currentStep: 3),
                const Spacer(),

                // ── Success animation ──────────────────────────────────────
                Center(
                  child: ScaleTransition(
                    scale: _scaleAnim,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.success.withOpacity(0.15),
                        border: Border.all(
                          color: AppColors.success.withOpacity(0.4),
                          width: 2,
                        ),
                      ),
                      child: const Icon(
                        Icons.check,
                        color: AppColors.success,
                        size: 52,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: Spacing.xl),

                provState.whenOrNull(
                  complete: (deviceId, deviceName) => Column(
                    children: [
                      Text(
                        'Device Added!',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(color: AppColors.textPrimary),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: Spacing.sm),
                      Text(
                        '"$deviceName" is now connected to your account\nand ready to monitor your water system.',
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: Spacing.xl),

                      // Device summary card
                      Container(
                        decoration: AppDecorations.surfaceCard(),
                        padding: const EdgeInsets.all(Spacing.md),
                        child: Row(
                          children: [
                            Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                color: AppColors.primary.withOpacity(0.1),
                                borderRadius:
                                    BorderRadius.circular(AppRadius.md),
                              ),
                              child: const Icon(Icons.water_drop,
                                  color: AppColors.primary, size: 22),
                            ),
                            const SizedBox(width: Spacing.md),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(deviceName,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium),
                                  Text('Device ID: $deviceId',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(fontSize: 10),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: Spacing.sm, vertical: Spacing.xs),
                              decoration:
                                  AppDecorations.statusBadge(AppColors.success),
                              child: Text('Active',
                                  style: TextStyle(
                                      color: AppColors.success,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w700)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ) ??
                    const SizedBox.shrink(),

                const Spacer(),

                // CTA
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [AppShadows.primaryGlow],
                    borderRadius: BorderRadius.circular(AppRadius.md),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      ref
                          .read(provisioningNotifierProvider.notifier)
                          .reset();
                      context.go('/dashboard');
                    },
                    child: const Text('Go to Dashboard'),
                  ),
                ),

                TextButton(
                  onPressed: () {
                    ref
                        .read(provisioningNotifierProvider.notifier)
                        .reset();
                    context.go('/provisioning/scan');
                  },
                  child: Text(
                    'Add another device',
                    style: TextStyle(
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: Spacing.lg),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
