import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/design_tokens.dart';
import '../../../core/theme/app_decorations.dart';
import '../../../shared/widgets/grid_background.dart';
import '../../../shared/models/device_model.dart';
import '../../../shared/models/telemetry_model.dart';
import '../data/dashboard_repository.dart';
import '../application/dashboard_providers.dart';
import 'widgets/interactive_tank.dart';
import 'widgets/intent_button.dart';
import 'widgets/connection_badge.dart';

// ─────────────────────────────────────────────────────────────────────────────
// DASHBOARD SCREEN
// Architecture: cache→live transition
//   1. Cold start: show Isar cached telemetry instantly (no loading flicker)
//   2. MQTT connects: seamlessly switch to live stream
// ─────────────────────────────────────────────────────────────────────────────

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    // Use post-frame callback so ref is available from the widget tree
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(deviceSelectorProvider.notifier).loadDevices();
    });
  }

  @override
  Widget build(BuildContext context) {
    final device = ref.watch(deviceSelectorProvider);

    if (device == null) {
      return _NoDeviceScreen(onRetry: () {
        ref.invalidate(deviceListProvider);
        ref.read(deviceSelectorProvider.notifier).loadDevices();
      });
    }

    // Cache: show immediately on cold start
    final cachedAsync  = ref.watch(cachedTelemetryProvider(device.id));
    // Live: takes over when MQTT connects (null until stream emits)
    final liveAsync    = ref.watch(telemetryStreamProvider(device.id));

    // Prefer live data; fall back to cache; fall back to API summary
    final telemetry = liveAsync.valueOrNull ?? cachedAsync.valueOrNull ?? _createFallbackTelemetry(device);

    return Scaffold(
      backgroundColor: AppColors.bgDark,
      body: GridBackground(
        child: SafeArea(
          child: Column(
            children: [
              // ── App Bar ────────────────────────────────────────────────
              _DashboardAppBar(
                deviceName: device.displayName,
                onDeviceTap: () => _showDevicePicker(context, ref),
              ),

              const SizedBox(height: Spacing.md),

              // ── Content ────────────────────────────────────────────────
              Expanded(
                child: RefreshIndicator(
                  color: AppColors.primary,
                  backgroundColor: AppColors.surfaceCard,
                  onRefresh: () async {
                    ref.invalidate(deviceListProvider);
                    await ref.read(deviceSelectorProvider.notifier).refreshDevices();
                  },
                  child: telemetry == null
                      ? SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: _DashboardSkeleton(),
                        )
                      : _DashboardContent(
                          deviceId: device.id,
                          data: telemetry,
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TelemetryData? _createFallbackTelemetry(Device device) {
    // Backend getUserDevices returns nested objects for oht and ugt
    // Let's safely extract water levels and mode from them if top-level fields are missing
    final double ohtLevel = device.ohtWaterLevel ?? (device.oht?['waterLevel'] as num?)?.toDouble() ?? 0.0;
    final double ugtLevel = device.ugtWaterLevel ?? (device.ugt?['waterLevel'] as num?)?.toDouble() ?? 0.0;
    
    return TelemetryData(
      deviceId: device.id,
      ohtLevel: ohtLevel,
      ugtLevel: ugtLevel,
      ohtMotorState: device.ohtState ?? (device.oht?['state'] as String?) ?? 'OFF',
      ugtMotorState: (device.ugt?['state'] as String?) ?? 'OFF',
      powerWatts: 0.0,
      energyKwh: 0.0,
      firmwareOhtMode: device.ohtMode ?? (device.oht?['mode'] as String?) ?? 'AUTO',
      firmwareUgtMode: (device.ugt?['mode'] as String?) ?? 'AUTO',
      isSystemSuspended: device.suspended ?? false,
      timestamp: device.lastSeenAt != null
          ? DateTime.tryParse(device.lastSeenAt!) ?? DateTime.now()
          : DateTime.now(),
    );
  }

  void _showDevicePicker(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.surfaceCard,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppRadius.xl),
        ),
      ),
      builder: (_) => _DevicePickerSheet(),
    );
  }
}

// ─── App Bar ──────────────────────────────────────────────────────────────────

class _DashboardAppBar extends StatelessWidget {
  final String deviceName;
  final VoidCallback onDeviceTap;

  const _DashboardAppBar({
    required this.deviceName,
    required this.onDeviceTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: Spacing.lg, vertical: Spacing.sm),
      child: Row(
        children: [
          // Device selector
          Expanded(
            child: GestureDetector(
              onTap: onDeviceTap,
              child: Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(AppRadius.sm),
                    ),
                    child: const Icon(Icons.water_drop,
                        color: AppColors.primary, size: 18),
                  ),
                  const SizedBox(width: Spacing.sm),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        deviceName,
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Switch device',
                            style: const TextStyle(
                                color: AppColors.textTertiary, fontSize: 10),
                          ),
                          const Icon(Icons.keyboard_arrow_down,
                              color: AppColors.textTertiary, size: 12),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Connection badge + settings
          const ConnectionBadge(),
          const SizedBox(width: Spacing.sm),
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            icon: const Icon(Icons.notifications_outlined,
                color: AppColors.textSecondary, size: 22),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

// ─── Main Content ─────────────────────────────────────────────────────────────

class _DashboardContent extends StatelessWidget {
  final String deviceId;
  final TelemetryData data;

  const _DashboardContent({
    required this.deviceId,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: Spacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ── Tank Visualizations ────────────────────────────────────────
          Container(
            decoration: AppDecorations.surfaceCard(),
            padding: const EdgeInsets.symmetric(
                horizontal: Spacing.sm, vertical: Spacing.lg),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      InteractiveTank(
                        tankId: 'oht',
                        label: 'Overhead Tank',
                        level: data.ohtLevel,
                        isMotorOn: data.ohtMotorState == 'ON',
                      ),
                      const SizedBox(height: Spacing.md),
                      _ModeToggleSwitch(
                        deviceId: deviceId,
                        motorId: 'oht',
                        currentMode: data.firmwareOhtMode,
                      ),
                    ],
                  ),
                ),
                // Divider
                Container(
                  width: 1,
                  height: 200,
                  color: AppColors.surfaceHighlight,
                ),
                Expanded(
                  child: Column(
                    children: [
                      InteractiveTank(
                        tankId: 'ugt',
                        label: 'Underground Tank',
                        level: data.ugtLevel,
                        isMotorOn: data.ugtMotorState == 'ON',
                      ),
                      const SizedBox(height: Spacing.md),
                      _ModeToggleSwitch(
                        deviceId: deviceId,
                        motorId: 'ugt',
                        currentMode: data.firmwareUgtMode,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: Spacing.md),

          // ── Motor Controls ─────────────────────────────────────────────
          Text(
            'Motor Controls',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: Spacing.sm),
          IntentButton(
            deviceId: deviceId,
            motorId: 'oht',
            initialIsRunning: data.ohtMotorState == 'ON',
            label: 'OHT Motor',
          ),
          const SizedBox(height: Spacing.sm),
          IntentButton(
            deviceId: deviceId,
            motorId: 'ugt',
            initialIsRunning: data.ugtMotorState == 'ON',
            label: 'UGT Motor',
          ),
          const SizedBox(height: Spacing.md),

          // ── System Info ────────────────────────────────────────────────
          _SystemInfoCard(data: data),
          const SizedBox(height: Spacing.md),

          // ── Quick Actions ──────────────────────────────────────────────
          Row(
            children: [
              Expanded(
                child: _QuickActionCard(
                  icon: Icons.calendar_today_outlined,
                  label: 'Schedules',
                  onTap: () => GoRouter.of(context).go('/schedules'),
                ),
              ),
              const SizedBox(width: Spacing.sm),
              Expanded(
                child: _QuickActionCard(
                  icon: Icons.bar_chart_outlined,
                  label: 'Insights',
                  onTap: () => GoRouter.of(context).go('/insight'),
                ),
              ),
              const SizedBox(width: Spacing.sm),
              Expanded(
                child: _QuickActionCard(
                  icon: Icons.add_circle_outline,
                  label: 'Add Device',
                  onTap: () => GoRouter.of(context).go('/provisioning'),
                ),
              ),
            ],
          ),
          const SizedBox(height: Spacing.xl),
        ],
      ),
    );
  }
}

// ─── System Info Card ─────────────────────────────────────────────────────────

class _SystemInfoCard extends ConsumerWidget {
  final TelemetryData data;
  const _SystemInfoCard({required this.data});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: AppDecorations.surfaceCard(),
      padding: const EdgeInsets.all(Spacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('System Info', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: Spacing.md),
          Row(
            children: [
              _InfoTile(
                  label: 'Power',
                  value: '${data.powerWatts.toStringAsFixed(1)}W',
                  icon: Icons.bolt_outlined),
              _InfoTile(
                  label: 'Energy',
                  value: '${data.energyKwh.toStringAsFixed(2)} kWh',
                  icon: Icons.electric_meter_outlined),
            ],
          ),
          if (data.isSystemSuspended)
            Container(
              margin: const EdgeInsets.only(top: Spacing.sm),
              padding: const EdgeInsets.all(Spacing.sm),
              decoration: AppDecorations.alertBanner(AppColors.warning),
              child: Row(
                children: const [
                  Icon(Icons.pause_circle_outline,
                      color: AppColors.warning, size: 16),
                  SizedBox(width: Spacing.xs),
                  Text('System suspended by administrator',
                      style: TextStyle(
                          color: AppColors.warning, fontSize: 12)),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _ModeToggleSwitch extends ConsumerWidget {
  final String deviceId;
  final String motorId;
  final String currentMode; // 'AUTO' | 'MANUAL'

  const _ModeToggleSwitch({
    required this.deviceId,
    required this.motorId,
    required this.currentMode,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAuto = currentMode == 'AUTO';

    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgDark,
        borderRadius: BorderRadius.circular(AppRadius.full),
        border: Border.all(color: AppColors.surfaceHighlight),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _ModeItem(
            label: 'AUTO',
            isActive: isAuto,
            activeColor: AppColors.primary,
            onTap: () => _setMode(context, ref, 'AUTO'),
          ),
          _ModeItem(
            label: 'MANUAL',
            isActive: !isAuto,
            activeColor: AppColors.warning,
            onTap: () => _setMode(context, ref, 'MANUAL'),
          ),
        ],
      ),
    );
  }

  Future<void> _setMode(BuildContext context, WidgetRef ref, String mode) async {
    if (currentMode == mode) return;

    try {
      final repo = ref.read(dashboardRepositoryProvider);
      await repo.setMode(deviceId: deviceId, motor: motorId, mode: mode);
      
      // Refresh to grab updated summary payload
      ref.invalidate(deviceListProvider);
      ref.read(deviceSelectorProvider.notifier).loadDevices();
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to change $motorId mode to $mode'),
            backgroundColor: AppColors.danger,
          ),
        );
      }
    }
  }
}

class _ModeItem extends StatelessWidget {
  final String label;
  final bool isActive;
  final Color activeColor;
  final VoidCallback onTap;

  const _ModeItem({
    required this.label,
    required this.isActive,
    required this.activeColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: Spacing.md, vertical: 6),
        decoration: BoxDecoration(
          color: isActive ? activeColor.withOpacity(0.15) : Colors.transparent,
          borderRadius: BorderRadius.circular(AppRadius.full),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isActive ? activeColor : AppColors.textTertiary,
            fontSize: 12,
            fontWeight: isActive ? FontWeight.w800 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _InfoTile({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, color: AppColors.textTertiary, size: 16),
          const SizedBox(height: Spacing.xs / 2),
          Text(value,
              style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 12,
                  fontWeight: FontWeight.w700)),
          Text(label,
              style: const TextStyle(
                  color: AppColors.textTertiary, fontSize: 10)),
        ],
      ),
    );
  }
}

// ─── Quick Action Card ────────────────────────────────────────────────────────

class _QuickActionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _QuickActionCard({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: AppDecorations.surfaceCard(),
        padding: const EdgeInsets.symmetric(
            vertical: Spacing.md, horizontal: Spacing.sm),
        child: Column(
          children: [
            Icon(icon, color: AppColors.primary, size: 22),
            const SizedBox(height: Spacing.xs),
            Text(
              label,
              style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 10,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Skeleton loader ──────────────────────────────────────────────────────────

class _DashboardSkeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.lg),
      child: Column(
        children: [
          _SkeletonBox(height: 200),
          const SizedBox(height: Spacing.md),
          _SkeletonBox(height: 60),
          const SizedBox(height: Spacing.sm),
          _SkeletonBox(height: 60),
          const SizedBox(height: Spacing.md),
          _SkeletonBox(height: 100),
        ],
      ),
    );
  }
}

class _SkeletonBox extends StatelessWidget {
  final double height;
  const _SkeletonBox({required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: AppColors.surfaceDark,
        borderRadius: BorderRadius.circular(AppRadius.lg),
      ),
    );
  }
}

// ─── No Device Screen ─────────────────────────────────────────────────────────

class _NoDeviceScreen extends StatelessWidget {
  final VoidCallback? onRetry;
  const _NoDeviceScreen({this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDark,
      body: GridBackground(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(Spacing.xl),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.water_drop_outlined,
                    color: AppColors.textTertiary, size: 64),
                const SizedBox(height: Spacing.lg),
                Text(
                  'No Device Yet',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: Spacing.sm),
                Text(
                  'Add your SmartTank device or wait for a device to be assigned.',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: Spacing.xl),
                if (onRetry != null)
                  OutlinedButton.icon(
                    icon: const Icon(Icons.refresh),
                    label: const Text('Retry'),
                    onPressed: onRetry,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.primary,
                      side: const BorderSide(color: AppColors.primary),
                    ),
                  ),
                const SizedBox(height: Spacing.sm),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [AppShadows.primaryGlow],
                    borderRadius: BorderRadius.circular(AppRadius.md),
                  ),
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.add),
                    label: const Text('Add Device'),
                    onPressed: () => context.go('/provisioning'),
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

// ─── Device Picker ────────────────────────────────────────────────────────────

class _DevicePickerSheet extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final devicesAsync = ref.watch(deviceListProvider);
    final currentDevice = ref.watch(deviceSelectorProvider);

    return Padding(
      padding: const EdgeInsets.all(Spacing.lg),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Your Devices',
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: Spacing.md),
          devicesAsync.when(
            data: (devices) => Column(
              children: devices.map((d) {
                final isSelected = d.id == currentDevice?.id;
                return ListTile(
                  leading: Icon(Icons.water_drop,
                      color: isSelected
                          ? AppColors.primary
                          : AppColors.textTertiary),
                  title: Text(d.displayName,
                      style: TextStyle(
                          color: isSelected
                              ? AppColors.primary
                              : AppColors.textPrimary,
                          fontWeight: isSelected
                              ? FontWeight.w700
                              : FontWeight.w400)),
                  trailing: isSelected
                      ? const Icon(Icons.check, color: AppColors.primary)
                      : null,
                  onTap: () {
                    ref
                        .read(deviceSelectorProvider.notifier)
                        .selectDevice(d);
                    Navigator.pop(context);
                  },
                );
              }).toList(),
            ),
            loading: () => const Center(
                child: CircularProgressIndicator(color: AppColors.primary)),
            error: (_, __) => const Text('Failed to load devices'),
          ),
          const SizedBox(height: Spacing.sm),
          TextButton.icon(
            icon: const Icon(Icons.add, color: AppColors.primary),
            label: Text('Add New Device',
                style: TextStyle(
                    color: AppColors.primary, fontWeight: FontWeight.w700)),
            onPressed: () {
              Navigator.pop(context);
              context.go('/provisioning');
            },
          ),
        ],
      ),
    );
  }
}
