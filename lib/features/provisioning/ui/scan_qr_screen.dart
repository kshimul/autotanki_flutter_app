import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../core/theme/design_tokens.dart';
import '../../../core/utils/haptics.dart';
import '../../../shared/widgets/grid_background.dart';
import '../application/provisioning_notifier.dart';
import '../application/provisioning_state.dart';

// ─────────────────────────────────────────────────────────────────────────────
// STEP 1: QR SCAN SCREEN
// Scans the device QR code, extracts claimCode + secretKey from payload.
// secretKey is kept in memory only (ProvisioningNotifier) — never persisted.
// ─────────────────────────────────────────────────────────────────────────────

class ScanQrScreen extends ConsumerStatefulWidget {
  const ScanQrScreen({super.key});

  @override
  ConsumerState<ScanQrScreen> createState() => _ScanQrScreenState();
}

class _ScanQrScreenState extends ConsumerState<ScanQrScreen> {
  MobileScannerController? _controller;
  bool _hasPermission = false;
  bool _scanned = false;

  @override
  void initState() {
    super.initState();
    _checkPermission();
  }

  Future<void> _checkPermission() async {
    final status = await Permission.camera.request();
    if (mounted) {
      setState(() => _hasPermission = status.isGranted);
      if (status.isGranted) {
        _controller = MobileScannerController();
      }
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Navigate when QR is scanned successfully
    ref.listen<ProvisioningState>(provisioningNotifierProvider, (_, next) {
      next.whenOrNull(
        qrScanned: (_) {
          AppHaptics.medium();
          context.go('/provisioning/ble');
        },
        error: (msg, step) {
          if (step == ProvisioningStep.qrScan) {
            _scanned = false; // Allow rescan on error
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
          child: Column(
            children: [
              // ── Header ──────────────────────────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Spacing.lg, vertical: Spacing.md),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.close,
                          color: AppColors.textPrimary),
                      onPressed: () => context.go('/dashboard'),
                    ),
                    const SizedBox(width: Spacing.sm),
                    Text(
                      'Add Device',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
              ),

              // ── Step indicator ──────────────────────────────────────────
              StepIndicator(currentStep: 0),
              const SizedBox(height: Spacing.lg),

              Text(
                'Scan Device QR Code',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: Spacing.xs),
              Text(
                'Point the camera at the QR code\non the bottom of your SmartTank device.',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: Spacing.lg),

              // ── QR Viewfinder ─────────────────────────────────────────
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Spacing.xl),
                  child: _hasPermission
                      ? ClipRRect(
                          borderRadius:
                              BorderRadius.circular(AppRadius.xl),
                          child: MobileScanner(
                            controller: _controller,
                            onDetect: (capture) {
                              if (_scanned) return;
                              final code = capture.barcodes.first.rawValue;
                              if (code != null) {
                                _scanned = true;
                                ref
                                    .read(provisioningNotifierProvider.notifier)
                                    .onQrCodeScanned(code);
                              }
                            },
                          ),
                        )
                      : _PermissionDeniedCard(onRetry: _checkPermission),
                ),
              ),

              const SizedBox(height: Spacing.xl),
            ],
          ),
        ),
      ),
    );
  }
}

class _PermissionDeniedCard extends StatelessWidget {
  final VoidCallback onRetry;
  const _PermissionDeniedCard({required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceCard,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: AppColors.surfaceHighlight),
      ),
      padding: const EdgeInsets.all(Spacing.lg),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.camera_alt_outlined,
              color: AppColors.textTertiary, size: 48),
          const SizedBox(height: Spacing.md),
          Text('Camera Permission Required',
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: Spacing.sm),
          Text(
            'Please allow camera access to scan the QR code.',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: Spacing.lg),
          ElevatedButton(
            onPressed: onRetry,
            child: const Text('Grant Permission'),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// SHARED STEP INDICATOR — 4-step breadcrumb used across wizard screens
// ─────────────────────────────────────────────────────────────────────────────

class StepIndicator extends StatelessWidget {
  final int currentStep; // 0-indexed

  const StepIndicator({super.key, required this.currentStep});

  static const _labels = ['QR Scan', 'BLE', 'Wi-Fi', 'Confirm'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.lg),
      child: Row(
        children: List.generate(_labels.length * 2 - 1, (i) {
          if (i.isOdd) {
            // Connector line
            final stepIndex = i ~/ 2;
            return Expanded(
              child: Container(
                height: 2,
                color: stepIndex < currentStep
                    ? AppColors.primary
                    : AppColors.surfaceHighlight,
              ),
            );
          }
          final stepIndex = i ~/ 2;
          final isActive = stepIndex == currentStep;
          final isDone = stepIndex < currentStep;
          return Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isDone || isActive
                  ? AppColors.primary
                  : AppColors.surfaceHighlight,
            ),
            child: Center(
              child: isDone
                  ? const Icon(Icons.check, size: 14, color: Colors.white)
                  : Text(
                      '${stepIndex + 1}',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: isActive
                            ? Colors.white
                            : AppColors.textTertiary,
                      ),
                    ),
            ),
          );
        }),
      ),
    );
  }
}
