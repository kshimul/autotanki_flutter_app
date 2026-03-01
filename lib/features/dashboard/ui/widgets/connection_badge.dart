import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/connection_state_notifier.dart';
import '../../../../core/theme/design_tokens.dart';
import '../../application/dashboard_providers.dart';

// ─────────────────────────────────────────────────────────────────────────────
// CONNECTION BADGE — top-right status indicator on dashboard
// Watches DeviceConnectionState and renders appropriate badge.
// ─────────────────────────────────────────────────────────────────────────────

class ConnectionBadge extends ConsumerWidget {
  const ConnectionBadge({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mqttState = ref.watch(connectionStateProvider);
    final device = ref.watch(deviceSelectorProvider);

    DeviceConnectionState effectiveState = mqttState;

    if (mqttState == DeviceConnectionState.online && device != null) {
      // Phone is connected to MQTT. Is the hardware device online?
      final telemetry = ref.watch(telemetryStreamProvider(device)).valueOrNull;
      
      final bool isDeviceOnline;
      if (telemetry != null) {
        isDeviceOnline = DateTime.now().difference(telemetry.timestamp).inMinutes < 3;
      } else {
        isDeviceOnline = device.isOnline ?? false;
      }

      if (!isDeviceOnline) {
        effectiveState = DeviceConnectionState.hardwareDisconnected;
      }
    }

    return AnimatedSwitcher(
      duration: AppDurations.fast,
      child: _badge(effectiveState),
    );
  }

  Widget _badge(DeviceConnectionState state) {
    return switch (state) {
      DeviceConnectionState.online => _Chip(
          key: const ValueKey('online'),
          label: 'Live',
          color: AppColors.success,
          icon: Icons.circle,
          iconSize: 6,
        ),
      DeviceConnectionState.connecting => _Chip(
          key: const ValueKey('connecting'),
          label: 'Connecting...',
          color: AppColors.warning,
          icon: Icons.wifi_tethering,
          iconSize: 12,
        ),
      DeviceConnectionState.offline => _Chip(
          key: const ValueKey('offline'),
          label: 'Offline',
          color: AppColors.textTertiary,
          icon: Icons.wifi_off,
          iconSize: 12,
        ),
      DeviceConnectionState.hardwareDisconnected => _Chip(
          key: const ValueKey('hw_disconnected'),
          label: 'Device Disconnected',
          color: AppColors.danger,
          icon: Icons.sensors_off,
          iconSize: 12,
        ),
    };
  }
}

class _Chip extends StatelessWidget {
  final String label;
  final Color color;
  final IconData icon;
  final double iconSize;

  const _Chip({
    super.key,
    required this.label,
    required this.color,
    required this.icon,
    required this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: Spacing.sm, vertical: Spacing.xs),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(AppRadius.full),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: iconSize),
          const SizedBox(width: Spacing.xs),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 11,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
