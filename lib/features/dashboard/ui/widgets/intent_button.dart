import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/design_tokens.dart';
import '../../application/motor_intent_notifier.dart';

// ─────────────────────────────────────────────────────────────────────────────
// INTENT BUTTON WIDGET
// Renders a motor control button driven by MotorIntentState:
//   IDLE     → shows current ON/OFF state, tappable
//   PENDING  → spinner overlay, disabled
//   ACTIVE   → success flash (green glow), briefly shown
//   ERROR    → red shake + error text, auto-clears
// ─────────────────────────────────────────────────────────────────────────────

class IntentButton extends ConsumerWidget {
  final String deviceId;
  final String motorId; // 'oht' | 'ugt'
  final bool initialIsRunning;
  final String label;

  const IntentButton({
    super.key,
    required this.deviceId,
    required this.motorId,
    required this.initialIsRunning,
    required this.label,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args = (
      deviceId: deviceId,
      motorId: motorId,
      initialIsRunning: initialIsRunning,
    );
    final intentState = ref.watch(motorIntentProvider(args));

    return intentState.when(
      idle: (_, isRunning) => _IdleButton(
        label: label,
        isRunning: isRunning,
        onTap: () => ref.read(motorIntentProvider(args).notifier).toggle(),
      ),
      pending: (_, isRunning, pendingAction) => _PendingButton(
        label: label,
        isRunning: isRunning,
        pendingAction: pendingAction,
      ),
      active: (_, isRunning) => _ActiveButton(
        label: label,
        isRunning: isRunning,
      ),
      error: (_, isRunning, message) => _ErrorButton(
        label: label,
        isRunning: isRunning,
        message: message,
        onRetry: () => ref.read(motorIntentProvider(args).notifier).toggle(),
      ),
    );
  }
}

// ─── Idle ─────────────────────────────────────────────────────────────────────

class _IdleButton extends StatelessWidget {
  final String label;
  final bool isRunning;
  final VoidCallback onTap;

  const _IdleButton({
    required this.label,
    required this.isRunning,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isRunning ? AppColors.success : AppColors.textTertiary;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: AppDurations.fast,
        decoration: BoxDecoration(
          color: AppColors.surfaceCard,
          borderRadius: BorderRadius.circular(AppRadius.lg),
          border: Border.all(
            color: isRunning
                ? AppColors.success.withOpacity(0.5)
                : AppColors.surfaceHighlight,
            width: 1.5,
          ),
          boxShadow: isRunning ? [AppShadows.card] : null,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: Spacing.lg,
          vertical: Spacing.md,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: Spacing.xs / 2),
                Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: color,
                      ),
                    ),
                    const SizedBox(width: Spacing.xs),
                    Text(
                      isRunning ? 'Running' : 'Off',
                      style: TextStyle(color: color, fontSize: 11),
                    ),
                  ],
                ),
              ],
            ),
            // Toggle switch-style indicator
            AnimatedContainer(
              duration: AppDurations.fast,
              width: 44,
              height: 24,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppRadius.full),
                color: isRunning
                    ? AppColors.success.withOpacity(0.2)
                    : AppColors.surfaceDark,
                border: Border.all(color: color.withOpacity(0.5)),
              ),
              child: AnimatedAlign(
                duration: AppDurations.fast,
                alignment:
                    isRunning ? Alignment.centerRight : Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: color,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Pending ──────────────────────────────────────────────────────────────────

class _PendingButton extends StatelessWidget {
  final String label;
  final bool isRunning;
  final String pendingAction;

  const _PendingButton({
    required this.label,
    required this.isRunning,
    required this.pendingAction,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.7,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surfaceCard,
          borderRadius: BorderRadius.circular(AppRadius.lg),
          border: Border.all(color: AppColors.primary.withOpacity(0.4)),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: Spacing.lg,
          vertical: Spacing.md,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: Spacing.xs / 2),
                Text(
                  'Turning ${pendingAction == 'ON' ? 'On' : 'Off'}...',
                  style:
                      const TextStyle(color: AppColors.primary, fontSize: 11),
                ),
              ],
            ),
            const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Active ───────────────────────────────────────────────────────────────────

class _ActiveButton extends StatelessWidget {
  final String label;
  final bool isRunning;

  const _ActiveButton({required this.label, required this.isRunning});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceCard,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: AppColors.success.withOpacity(0.8)),
        boxShadow: [AppShadows.card],
      ),
      padding: const EdgeInsets.symmetric(
          horizontal: Spacing.lg, vertical: Spacing.md),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                  style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.w600)),
              const SizedBox(height: Spacing.xs / 2),
              Text('Confirmed ✓',
                  style:
                      const TextStyle(color: AppColors.success, fontSize: 11)),
            ],
          ),
          const Icon(Icons.check_circle, color: AppColors.success, size: 20),
        ],
      ),
    );
  }
}

// ─── Error ────────────────────────────────────────────────────────────────────

class _ErrorButton extends StatelessWidget {
  final String label;
  final bool isRunning;
  final String message;
  final VoidCallback onRetry;

  const _ErrorButton({
    required this.label,
    required this.isRunning,
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onRetry,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surfaceCard,
          borderRadius: BorderRadius.circular(AppRadius.lg),
          border: Border.all(color: AppColors.danger.withOpacity(0.5)),
          boxShadow: [AppShadows.dangerGlow],
        ),
        padding: const EdgeInsets.symmetric(
            horizontal: Spacing.lg, vertical: Spacing.md),
        child: Row(
          children: [
            const Icon(Icons.error_outline, color: AppColors.danger, size: 18),
            const SizedBox(width: Spacing.sm),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(color: AppColors.danger, fontSize: 12),
                maxLines: 2,
              ),
            ),
            const SizedBox(width: Spacing.sm),
            Text('Retry',
                style: const TextStyle(
                    color: AppColors.primary,
                    fontSize: 11,
                    fontWeight: FontWeight.w700)),
          ],
        ),
      ),
    );
  }
}
