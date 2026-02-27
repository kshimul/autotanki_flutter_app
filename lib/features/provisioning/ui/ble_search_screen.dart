import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../core/theme/design_tokens.dart';
import '../../../core/theme/app_decorations.dart';
import '../../../core/utils/haptics.dart';
import '../../../shared/widgets/grid_background.dart';
import '../application/provisioning_notifier.dart';
import '../application/provisioning_state.dart';
import 'scan_qr_screen.dart' show StepIndicator;

// ─────────────────────────────────────────────────────────────────────────────
// STEP 2: BLE SEARCH SCREEN
// Scans for nearby SmartTank BLE devices, shows found device card.
// ─────────────────────────────────────────────────────────────────────────────

class BleSearchScreen extends ConsumerStatefulWidget {
  const BleSearchScreen({super.key});

  @override
  ConsumerState<BleSearchScreen> createState() => _BleSearchScreenState();
}

class _BleSearchScreenState extends ConsumerState<BleSearchScreen> {
  @override
  void initState() {
    super.initState();
    _requestPermissionsAndScan();
  }

  Future<void> _requestPermissionsAndScan() async {
    // Android 12+ requires BLUETOOTH_SCAN + BLUETOOTH_CONNECT
    final statuses = await [
      Permission.bluetoothScan,
      Permission.bluetoothConnect,
      Permission.locationWhenInUse,
    ].request();

    final allGranted = statuses.values.every((s) => s.isGranted);
    if (allGranted && mounted) {
      ref.read(provisioningNotifierProvider.notifier).startBleScan();
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Bluetooth permissions required to find your device.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final provState = ref.watch(provisioningNotifierProvider);

    ref.listen<ProvisioningState>(provisioningNotifierProvider, (_, next) {
      next.whenOrNull(
        bleConnected: (_) {
          AppHaptics.medium();
          context.go('/provisioning/wifi');
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
                      onPressed: () => context.go('/provisioning/scan'),
                    ),
                    Text('Add Device',
                        style: Theme.of(context).textTheme.titleLarge),
                  ],
                ),

                const SizedBox(height: Spacing.md),
                StepIndicator(currentStep: 1),
                const SizedBox(height: Spacing.xl),

                Text('Finding Your Device',
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center),
                const SizedBox(height: Spacing.xs),
                Text(
                  'Make sure your SmartTank device is powered on\nand within 1 metre.',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: Spacing.xl),

                // State-driven content
                Expanded(
                  child: provState.when(
                    idle: () => _ScanningIndicator(),
                    qrScanned: (_) => _ScanningIndicator(),
                    bleScanning: () => _ScanningIndicator(),
                    bleFound: (deviceId, deviceName) => _DeviceFoundCard(
                      deviceName: deviceName,
                      deviceId: deviceId,
                      onConnect: () async {
                        final device = BluetoothDevice.fromId(deviceId);
                        await ref
                            .read(provisioningNotifierProvider.notifier)
                            .connectToBleDevice(device);
                      },
                    ),
                    bleConnected: (_) => _ScanningIndicator(),
                    error: (msg, step) => _ErrorCard(
                      message: msg,
                      onRetry: () => ref
                          .read(provisioningNotifierProvider.notifier)
                          .startBleScan(),
                    ),
                    // Other states not shown on this screen
                    awaitingWifi: (_, __) => _ScanningIndicator(),
                    sendingWifi: () => _ScanningIndicator(),
                    claimingDevice: (_) => _ScanningIndicator(),
                    complete: (_, __) => _ScanningIndicator(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ScanningIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircularProgressIndicator(color: AppColors.primary),
        const SizedBox(height: Spacing.lg),
        Text('Searching for SmartTank devices via Bluetooth...',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center),
      ],
    );
  }
}

class _DeviceFoundCard extends StatelessWidget {
  final String deviceName;
  final String deviceId;
  final VoidCallback onConnect;

  const _DeviceFoundCard({
    required this.deviceName,
    required this.deviceId,
    required this.onConnect,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: AppDecorations.surfaceCard(),
          padding: const EdgeInsets.all(Spacing.lg),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppRadius.md),
                ),
                child: const Icon(Icons.water_drop,
                    color: AppColors.primary, size: 24),
              ),
              const SizedBox(width: Spacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(deviceName,
                        style: Theme.of(context).textTheme.titleMedium),
                    Text(
                      deviceId,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 10),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: Spacing.sm, vertical: Spacing.xs),
                decoration: AppDecorations.statusBadge(AppColors.success),
                child: Text(
                  'Found',
                  style: TextStyle(
                      color: AppColors.success,
                      fontSize: 11,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: Spacing.lg),
        Container(
          decoration: BoxDecoration(
            boxShadow: [AppShadows.primaryGlow],
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
          child: ElevatedButton(
            onPressed: onConnect,
            child: const Text('Connect to Device'),
          ),
        ),
      ],
    );
  }
}

class _ErrorCard extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ErrorCard({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: AppDecorations.alertBanner(AppColors.danger),
          padding: const EdgeInsets.all(Spacing.md),
          child: Row(
            children: [
              const Icon(Icons.error_outline, color: AppColors.danger),
              const SizedBox(width: Spacing.sm),
              Expanded(
                child: Text(message,
                    style: const TextStyle(color: AppColors.textPrimary)),
              ),
            ],
          ),
        ),
        const SizedBox(height: Spacing.lg),
        OutlinedButton(
          onPressed: onRetry,
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: AppColors.primary),
            foregroundColor: AppColors.primary,
          ),
          child: const Text('Try Again'),
        ),
      ],
    );
  }
}
