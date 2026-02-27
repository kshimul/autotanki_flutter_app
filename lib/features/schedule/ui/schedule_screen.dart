import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/design_tokens.dart';
import '../../../core/theme/app_decorations.dart';
import '../../../shared/widgets/grid_background.dart';
import '../../../shared/models/schedule_model.dart';
import '../../../features/dashboard/application/dashboard_providers.dart';
import '../data/schedule_repository.dart';

// ─────────────────────────────────────────────────────────────────────────────
// SCHEDULE SCREEN — Automation schedule list + create/toggle/delete
// ─────────────────────────────────────────────────────────────────────────────

class ScheduleScreen extends ConsumerWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final device = ref.watch(deviceSelectorProvider);
    if (device == null) {
      return const Scaffold(
        backgroundColor: AppColors.bgDark,
        body: Center(
            child: Text('No device selected',
                style: TextStyle(color: AppColors.textSecondary))),
      );
    }

    final schedulesAsync = ref.watch(schedulesProvider(device.id));

    return Scaffold(
      backgroundColor: AppColors.bgDark,
      floatingActionButton: Container(
        decoration: BoxDecoration(
          boxShadow: [AppShadows.primaryGlow],
          borderRadius: BorderRadius.circular(AppRadius.full),
        ),
        child: FloatingActionButton(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          onPressed: () => _showCreateSheet(context, ref, device.id),
          child: const Icon(Icons.add),
        ),
      ),
      body: GridBackground(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Spacing.lg, vertical: Spacing.md),
                child: Text('Schedules',
                    style: Theme.of(context).textTheme.titleLarge),
              ),

              Expanded(
                child: schedulesAsync.when(
                  loading: () => const Center(
                      child: CircularProgressIndicator(
                          color: AppColors.primary)),
                  error: (e, _) => Center(
                      child: Text('Failed to load schedules',
                          style: TextStyle(color: AppColors.danger))),
                  data: (schedules) => schedules.isEmpty
                      ? _EmptySchedules(
                          onAdd: () =>
                              _showCreateSheet(context, ref, device.id))
                      : ListView.separated(
                          padding: const EdgeInsets.symmetric(
                              horizontal: Spacing.lg),
                          itemCount: schedules.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: Spacing.sm),
                          itemBuilder: (_, i) => _ScheduleCard(
                            schedule: schedules[i],
                            deviceId: device.id,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showCreateSheet(BuildContext context, WidgetRef ref, String deviceId) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.surfaceCard,
      shape: const RoundedRectangleBorder(
        borderRadius:
            BorderRadius.vertical(top: Radius.circular(AppRadius.xl)),
      ),
      builder: (_) => _CreateScheduleSheet(deviceId: deviceId),
    );
  }
}

// ─── Schedule Card ────────────────────────────────────────────────────────────

class _ScheduleCard extends ConsumerWidget {
  final Schedule schedule;
  final String deviceId;

  const _ScheduleCard({required this.schedule, required this.deviceId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repo = ref.read(scheduleRepositoryProvider);

    return Container(
      decoration: AppDecorations.surfaceCard(),
      padding: const EdgeInsets.symmetric(
          horizontal: Spacing.md, vertical: Spacing.sm),
      child: Row(
        children: [
          // Motor icon
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: schedule.isActive
                  ? AppColors.primary.withOpacity(0.1)
                  : AppColors.surfaceDark,
              borderRadius: BorderRadius.circular(AppRadius.sm),
            ),
            child: Icon(
              Icons.schedule,
              color: schedule.isActive
                  ? AppColors.primary
                  : AppColors.textTertiary,
              size: 18,
            ),
          ),
          const SizedBox(width: Spacing.md),

          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  schedule.name,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '${schedule.tank.toUpperCase()} · ${schedule.action} · ${schedule.cronExpression}',
                  style: const TextStyle(
                      color: AppColors.textTertiary, fontSize: 10),
                ),
              ],
            ),
          ),

          // Toggle
          Switch(
            value: schedule.isActive,
            activeThumbColor: AppColors.primary,
            onChanged: (val) async {
              await repo.toggleSchedule(deviceId, schedule.id, val);
              // ignore: unused_result
              ref.invalidate(schedulesProvider(deviceId));
            },
          ),

          // Delete
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            icon: const Icon(Icons.delete_outline,
                color: AppColors.textTertiary, size: 18),
            onPressed: () async {
              await repo.deleteSchedule(deviceId, schedule.id);
              ref.invalidate(schedulesProvider(deviceId));
            },
          ),
        ],
      ),
    );
  }
}

// ─── Create Schedule Sheet ────────────────────────────────────────────────────

class _CreateScheduleSheet extends ConsumerStatefulWidget {
  final String deviceId;
  const _CreateScheduleSheet({required this.deviceId});

  @override
  ConsumerState<_CreateScheduleSheet> createState() =>
      _CreateScheduleSheetState();
}

class _CreateScheduleSheetState extends ConsumerState<_CreateScheduleSheet> {
  final _nameCtrl = TextEditingController();
  String _motor  = 'oht';
  String _action = 'ON';
  TimeOfDay _time = TimeOfDay.now();
  final _days = <int>{1, 2, 3, 4, 5}; // Mon–Fri default
  bool _saving = false;

  static const _dayLabels = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

  String get _cronExpression {
    final dayStr = _days.isEmpty ? '*' : _days.join(',');
    return '${_time.minute} ${_time.hour} * * $dayStr';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: Spacing.lg,
        right: Spacing.lg,
        top: Spacing.lg,
        bottom: MediaQuery.of(context).viewInsets.bottom + Spacing.lg,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('New Schedule',
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: Spacing.md),

          // Name
          TextFormField(
            controller: _nameCtrl,
            style: const TextStyle(color: AppColors.textPrimary),
            decoration: AppDecorations.inputDecoration(
                label: 'Schedule Name', icon: Icons.label_outline),
          ),
          const SizedBox(height: Spacing.md),

          // Motor + Action row
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<String>(
                  initialValue: _motor,
                  dropdownColor: AppColors.surfaceDark,
                  style: const TextStyle(color: AppColors.textPrimary),
                  decoration: AppDecorations.inputDecoration(
                      label: 'Motor', icon: Icons.water_drop_outlined),
                  items: [
                    DropdownMenuItem(value: 'oht', child: const Text('OHT Motor')),
                    DropdownMenuItem(value: 'ugt', child: const Text('UGT Motor')),
                  ],
                  onChanged: (v) => setState(() => _motor = v!),
                ),
              ),
              const SizedBox(width: Spacing.sm),
              Expanded(
                child: DropdownButtonFormField<String>(
                  initialValue: _action,
                  dropdownColor: AppColors.surfaceDark,
                  style: const TextStyle(color: AppColors.textPrimary),
                  decoration: AppDecorations.inputDecoration(
                      label: 'Action', icon: Icons.power_settings_new),
                  items: [
                    DropdownMenuItem(value: 'ON', child: const Text('Turn ON')),
                    DropdownMenuItem(value: 'OFF', child: const Text('Turn OFF')),
                  ],
                  onChanged: (v) => setState(() => _action = v!),
                ),
              ),
            ],
          ),
          const SizedBox(height: Spacing.md),

          // Time picker
          GestureDetector(
            onTap: () async {
              final t = await showTimePicker(
                context: context,
                initialTime: _time,
              );
              if (t != null) setState(() => _time = t);
            },
            child: Container(
              decoration: AppDecorations.surfaceCard(),
              padding: const EdgeInsets.symmetric(
                  horizontal: Spacing.md, vertical: Spacing.md),
              child: Row(
                children: [
                  const Icon(Icons.access_time,
                      color: AppColors.textTertiary, size: 18),
                  const SizedBox(width: Spacing.sm),
                  Text('Time: ${_time.format(context)}',
                      style: const TextStyle(color: AppColors.textPrimary)),
                ],
              ),
            ),
          ),
          const SizedBox(height: Spacing.sm),

          // Day selector
          Wrap(
            spacing: Spacing.xs,
            children: List.generate(7, (i) {
              final selected = _days.contains(i);
              return FilterChip(
                label: Text(_dayLabels[i],
                    style: TextStyle(
                        color: selected
                            ? Colors.white
                            : AppColors.textSecondary,
                        fontSize: 11)),
                selected: selected,
                selectedColor: AppColors.primary,
                backgroundColor: AppColors.surfaceDark,
                checkmarkColor: Colors.white,
                onSelected: (val) => setState(() {
                  if (val) {
                    _days.add(i);
                  } else {
                    _days.remove(i);
                  }
                }),
              );
            }),
          ),
          const SizedBox(height: Spacing.md),

          // Cron preview
          Text(
            'Cron: $_cronExpression',
            style: const TextStyle(
                color: AppColors.textTertiary,
                fontSize: 10,
                fontFamily: 'monospace'),
          ),
          const SizedBox(height: Spacing.md),

          ElevatedButton(
            onPressed: _saving ? null : _save,
            child: _saving
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                        strokeWidth: 2, color: Colors.white))
                : const Text('Create Schedule'),
          ),
        ],
      ),
    );
  }

  Future<void> _save() async {
    if (_nameCtrl.text.trim().isEmpty) return;
    setState(() => _saving = true);
    try {
      await ref.read(scheduleRepositoryProvider).createSchedule(
            CreateScheduleRequest(
              deviceId: widget.deviceId,
              name: _nameCtrl.text.trim(),
              tank: _motor,
              action: _action,
              cronExpression: _cronExpression,
            ),
          );
      ref.invalidate(schedulesProvider(widget.deviceId));
      if (mounted) Navigator.pop(context);
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }
}

class _EmptySchedules extends StatelessWidget {
  final VoidCallback onAdd;
  const _EmptySchedules({required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.schedule, color: AppColors.textTertiary, size: 64),
          const SizedBox(height: Spacing.md),
          Text('No Schedules Yet',
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: Spacing.xs),
          Text('Automate your motors with a schedule.',
              style: TextStyle(color: AppColors.textTertiary, fontSize: 12)),
          const SizedBox(height: Spacing.lg),
          ElevatedButton.icon(
            icon: const Icon(Icons.add),
            label: const Text('Add Schedule'),
            onPressed: onAdd,
          ),
        ],
      ),
    );
  }
}
