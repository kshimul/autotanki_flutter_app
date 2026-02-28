import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/design_tokens.dart';
import '../../../core/theme/app_decorations.dart';
import '../../../shared/widgets/grid_background.dart';
import '../../../shared/models/device_config_model.dart';
import '../../../shared/models/support_model.dart';
import '../../../features/auth/application/auth_notifier.dart';
import '../../../features/dashboard/application/dashboard_providers.dart';
import '../data/settings_repository.dart';

// ─────────────────────────────────────────────────────────────────────────────
// SETTINGS SCREEN — Profile, Tank Config, Device Shares, Support, Logout
// ─────────────────────────────────────────────────────────────────────────────

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final device = ref.watch(deviceSelectorProvider);

    return Scaffold(
      backgroundColor: AppColors.bgDark,
      body: GridBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: Spacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: Spacing.md),
                Text('Settings', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: Spacing.md),

                // ── Profile ──────────────────────────────────────────────
                _SectionHeader(title: 'Account'),
                _SettingsTile(
                  icon: Icons.person_outline,
                  label: 'Edit Profile',
                  onTap: () => _showEditProfile(context, ref),
                ),
                _SettingsTile(
                  icon: Icons.lock_outline,
                  label: 'Change Password',
                  onTap: () => _showChangePassword(context, ref),
                ),
                const SizedBox(height: Spacing.sm),

                // ── Device ───────────────────────────────────────────────
                if (device != null) ...[
                  _SectionHeader(title: 'Device: ${device.displayName}'),
                  _SettingsTile(
                    icon: Icons.water_drop_outlined,
                    label: 'Tank Configuration',
                    onTap: () => _showTankConfig(context, ref, device.id),
                  ),
                  _SettingsTile(
                    icon: Icons.share_outlined,
                    label: 'Share Device',
                    onTap: () => _showDeviceShares(context, ref, device.id),
                  ),
                  const SizedBox(height: Spacing.sm),
                ],

                // ── Support ──────────────────────────────────────────────
                _SectionHeader(title: 'Support'),
                _SettingsTile(
                  icon: Icons.support_agent,
                  label: 'My Tickets',
                  onTap: () => _showTickets(context, ref),
                ),
                _SettingsTile(
                  icon: Icons.add_circle_outline,
                  label: 'New Support Ticket',
                  onTap: () => _showCreateTicket(context, ref, device?.id),
                ),
                const SizedBox(height: Spacing.sm),

                // ── App ─────────────────────────────────────────────────
                _SectionHeader(title: 'App'),
                _SettingsTile(
                  icon: Icons.info_outline,
                  label: 'Version',
                  trailing: const Text('1.0.0',
                      style: TextStyle(
                          color: AppColors.textTertiary, fontSize: 12)),
                ),
                const SizedBox(height: Spacing.sm),

                // ── Logout ───────────────────────────────────────────────
                Container(
                  decoration: AppDecorations.alertBanner(AppColors.danger),
                  child: ListTile(
                    leading: const Icon(Icons.logout, color: AppColors.danger),
                    title: const Text('Logout',
                        style: TextStyle(
                            color: AppColors.danger,
                            fontWeight: FontWeight.w700)),
                    onTap: () async {
                      await ref
                          .read(authNotifierProvider.notifier)
                          .logout();
                    },
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

  // ── Profile edit sheet ─────────────────────────────────────────────────────
  void _showEditProfile(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.surfaceCard,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(AppRadius.xl))),
      builder: (_) => _EditProfileSheet(),
    );
  }

  void _showChangePassword(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.surfaceCard,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(AppRadius.xl))),
      builder: (_) => _ChangePasswordSheet(),
    );
  }

  void _showTankConfig(BuildContext context, WidgetRef ref, String deviceId) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.surfaceCard,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(AppRadius.xl))),
      builder: (_) => _TankConfigSheet(deviceId: deviceId),
    );
  }

  void _showDeviceShares(BuildContext context, WidgetRef ref, String deviceId) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.surfaceCard,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(AppRadius.xl))),
      builder: (_) => _DeviceSharesSheet(deviceId: deviceId),
    );
  }

  void _showTickets(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.surfaceCard,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(AppRadius.xl))),
      builder: (_) => _TicketsSheet(),
    );
  }

  void _showCreateTicket(BuildContext context, WidgetRef ref, String? deviceId) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.surfaceCard,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(AppRadius.xl))),
      builder: (_) => _CreateTicketSheet(deviceId: deviceId),
    );
  }
}

// ─── Shared reusable tiles ────────────────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Spacing.xs),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(
            color: AppColors.textTertiary,
            fontSize: 10,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2),
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final Widget? trailing;

  const _SettingsTile({
    required this.icon,
    required this.label,
    this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: Spacing.xs),
      decoration: AppDecorations.surfaceCard(),
      child: ListTile(
        dense: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: Spacing.md),
        leading: Icon(icon, color: AppColors.primary, size: 20),
        title: Text(label,
            style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 13,
                fontWeight: FontWeight.w500)),
        trailing: trailing ??
            (onTap != null
                ? const Icon(Icons.chevron_right,
                    color: AppColors.textTertiary, size: 18)
                : null),
        onTap: onTap,
      ),
    );
  }
}

// ─── Edit Profile Sheet ───────────────────────────────────────────────────────

class _EditProfileSheet extends ConsumerStatefulWidget {
  @override
  ConsumerState<_EditProfileSheet> createState() => _EditProfileSheetState();
}

class _EditProfileSheetState extends ConsumerState<_EditProfileSheet> {
  final _nameCtrl  = TextEditingController();
  final _phoneCtrl = TextEditingController();
  bool _saving = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: Spacing.lg, right: Spacing.lg, top: Spacing.lg,
        bottom: MediaQuery.of(context).viewInsets.bottom + Spacing.lg,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Edit Profile', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: Spacing.md),
          TextFormField(
            controller: _nameCtrl,
            style: const TextStyle(color: AppColors.textPrimary),
            decoration: AppDecorations.inputDecoration(
                label: 'Full Name', icon: Icons.person_outline),
          ),
          const SizedBox(height: Spacing.sm),
          TextFormField(
            controller: _phoneCtrl,
            keyboardType: TextInputType.phone,
            style: const TextStyle(color: AppColors.textPrimary),
            decoration: AppDecorations.inputDecoration(
                label: 'Phone', icon: Icons.phone_outlined),
          ),
          const SizedBox(height: Spacing.md),
          ElevatedButton(
            onPressed: _saving ? null : _save,
            child: _saving
                ? const SizedBox(width: 18, height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                : const Text('Save'),
          ),
        ],
      ),
    );
  }

  Future<void> _save() async {
    setState(() => _saving = true);
    try {
      await ref.read(settingsRepositoryProvider).updateProfile(
        fullName: _nameCtrl.text.trim().isEmpty ? null : _nameCtrl.text.trim(),
        phone: _phoneCtrl.text.trim().isEmpty ? null : _phoneCtrl.text.trim(),
      );
      if (mounted) Navigator.pop(context);
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }
}

// ─── Change Password Sheet ────────────────────────────────────────────────────

class _ChangePasswordSheet extends ConsumerStatefulWidget {
  @override
  ConsumerState<_ChangePasswordSheet> createState() =>
      _ChangePasswordSheetState();
}

class _ChangePasswordSheetState extends ConsumerState<_ChangePasswordSheet> {
  final _oldCtrl = TextEditingController();
  final _newCtrl = TextEditingController();
  bool _saving = false;
  bool _obscureOld = true;
  bool _obscureNew = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: Spacing.lg, right: Spacing.lg, top: Spacing.lg,
        bottom: MediaQuery.of(context).viewInsets.bottom + Spacing.lg,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Change Password',
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: Spacing.md),
          TextFormField(
            controller: _oldCtrl,
            obscureText: _obscureOld,
            style: const TextStyle(color: AppColors.textPrimary),
            decoration: AppDecorations.inputDecoration(
              label: 'Current Password',
              icon: Icons.lock_outline,
              suffixIcon: IconButton(
                icon: Icon(_obscureOld
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                    color: AppColors.textTertiary, size: 18),
                onPressed: () => setState(() => _obscureOld = !_obscureOld),
              ),
            ),
          ),
          const SizedBox(height: Spacing.sm),
          TextFormField(
            controller: _newCtrl,
            obscureText: _obscureNew,
            style: const TextStyle(color: AppColors.textPrimary),
            decoration: AppDecorations.inputDecoration(
              label: 'New Password (min 8 chars)',
              icon: Icons.lock_outline,
              suffixIcon: IconButton(
                icon: Icon(_obscureNew
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                    color: AppColors.textTertiary, size: 18),
                onPressed: () => setState(() => _obscureNew = !_obscureNew),
              ),
            ),
          ),
          const SizedBox(height: Spacing.md),
          ElevatedButton(
            onPressed: _saving ? null : _save,
            child: _saving
                ? const SizedBox(width: 18, height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                : const Text('Update Password'),
          ),
        ],
      ),
    );
  }

  Future<void> _save() async {
    if (_newCtrl.text.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('New password must be at least 8 characters')));
      return;
    }
    setState(() => _saving = true);
    try {
      await ref.read(settingsRepositoryProvider).changePassword(
        oldPassword: _oldCtrl.text,
        newPassword: _newCtrl.text,
      );
      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Password updated successfully')));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: ${e.toString()}')));
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }
}

// ─── Tank Config Sheet ────────────────────────────────────────────────────────

class _TankConfigSheet extends ConsumerWidget {
  final String deviceId;
  const _TankConfigSheet({required this.deviceId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final configAsync = ref.watch(tankConfigProvider(deviceId));

    return Padding(
      padding: EdgeInsets.only(
        left: Spacing.lg, right: Spacing.lg, top: Spacing.lg,
        bottom: MediaQuery.of(context).viewInsets.bottom + Spacing.lg,
      ),
      child: configAsync.when(
        loading: () => const SizedBox(height: 100,
            child: Center(child: CircularProgressIndicator(color: AppColors.primary))),
        error: (_, __) => Text('Failed to load config',
            style: TextStyle(color: AppColors.danger)),
        data: (config) => _TankConfigForm(deviceId: deviceId, config: config),
      ),
    );
  }
}

class _TankConfigForm extends ConsumerStatefulWidget {
  final String deviceId;
  final TankConfig config;
  const _TankConfigForm({required this.deviceId, required this.config});

  @override
  ConsumerState<_TankConfigForm> createState() => _TankConfigFormState();
}

class _TankConfigFormState extends ConsumerState<_TankConfigForm> {
  late double _ohtCapacity;
  late double _ugtCapacity;
  late double _refillThreshold;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _ohtCapacity = widget.config.ohtCapacityLiters ?? 0.0;
    _ugtCapacity = widget.config.ugtCapacityLiters ?? 0.0;
    _refillThreshold = widget.config.ohtLowThreshold ?? 30.0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Tank Configuration',
            style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: Spacing.md),

        _SliderField(
            label: 'OHT Capacity',
            value: _ohtCapacity,
            min: 100,
            max: 10000,
            unit: 'L',
            onChanged: (v) => setState(() => _ohtCapacity = v)),
        _SliderField(
            label: 'UGT Capacity',
            value: _ugtCapacity,
            min: 100,
            max: 50000,
            unit: 'L',
            onChanged: (v) => setState(() => _ugtCapacity = v)),
        _SliderField(
            label: 'Refill Trigger',
            value: _refillThreshold,
            min: 10,
            max: 90,
            unit: '%',
            onChanged: (v) => setState(() => _refillThreshold = v)),

        const SizedBox(height: Spacing.md),
        ElevatedButton(
          onPressed: _saving ? null : _save,
          child: _saving
              ? const SizedBox(width: 18, height: 18,
                  child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
              : const Text('Save Configuration'),
        ),
      ],
    );
  }

  Future<void> _save() async {
    setState(() => _saving = true);
    try {
      await ref.read(settingsRepositoryProvider).updateTankConfig(
        widget.deviceId,
        widget.config.copyWith(
          ohtCapacityLiters: _ohtCapacity,
          ugtCapacityLiters: _ugtCapacity,
          ohtLowThreshold: _refillThreshold,
        ),
      );
      ref.invalidate(tankConfigProvider(widget.deviceId));
      if (mounted) Navigator.pop(context);
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }
}

class _SliderField extends StatelessWidget {
  final String label;
  final double value;
  final double min;
  final double max;
  final String unit;
  final ValueChanged<double> onChanged;

  const _SliderField({
    required this.label,
    required this.value,
    required this.min,
    required this.max,
    required this.unit,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label,
                style: const TextStyle(
                    color: AppColors.textSecondary, fontSize: 12)),
            Text('${value.round()} $unit',
                style: const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w700,
                    fontSize: 12)),
          ],
        ),
        Slider(
          value: value,
          min: min,
          max: max,
          activeColor: AppColors.primary,
          inactiveColor: AppColors.surfaceHighlight,
          onChanged: onChanged,
        ),
      ],
    );
  }
}

// ─── Device Shares Sheet ──────────────────────────────────────────────────────

class _DeviceSharesSheet extends ConsumerWidget {
  final String deviceId;
  const _DeviceSharesSheet({required this.deviceId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sharesAsync = ref.watch(deviceSharesProvider(deviceId));

    return Padding(
      padding: const EdgeInsets.all(Spacing.lg),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Shared With', style: Theme.of(context).textTheme.titleLarge),
              TextButton.icon(
                icon: const Icon(Icons.add, size: 16, color: AppColors.primary),
                label: const Text('Invite',
                    style: TextStyle(color: AppColors.primary, fontSize: 12)),
                onPressed: () => _showInviteSheet(context, ref),
              ),
            ],
          ),
          const SizedBox(height: Spacing.sm),
          sharesAsync.when(
            loading: () => const Center(
                child: CircularProgressIndicator(color: AppColors.primary)),
            error: (_, __) => Text('Failed to load shares',
                style: TextStyle(color: AppColors.danger)),
            data: (shares) => shares.isEmpty
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: Spacing.lg),
                    child: Text('Not shared with anyone yet.',
                        style: TextStyle(
                            color: AppColors.textTertiary), textAlign: TextAlign.center))
                : Column(
                    children: shares.map((s) => ListTile(
                      leading: const Icon(Icons.person_outline,
                          color: AppColors.textSecondary),
                      title: Text(s.sharedWithEmail,
                          style: const TextStyle(color: AppColors.textPrimary, fontSize: 13)),
                      subtitle: Text(s.permissionLevel,
                          style: const TextStyle(color: AppColors.textTertiary, fontSize: 10)),
                      trailing: IconButton(
                        icon: const Icon(Icons.remove_circle_outline,
                            color: AppColors.danger, size: 18),
                        onPressed: () async {
                          await ref.read(settingsRepositoryProvider)
                              .removeShare(deviceId, s.id);
                          ref.invalidate(deviceSharesProvider(deviceId));
                        },
                      ),
                    )).toList(),
                  ),
          ),
        ],
      ),
    );
  }

  void _showInviteSheet(BuildContext context, WidgetRef ref) {
    final emailCtrl = TextEditingController();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: AppColors.surfaceCard,
        title: const Text('Invite User',
            style: TextStyle(color: AppColors.textPrimary)),
        content: TextField(
          controller: emailCtrl,
          style: const TextStyle(color: AppColors.textPrimary),
          decoration: const InputDecoration(
            hintText: 'Email address',
            hintStyle: TextStyle(color: AppColors.textTertiary),
          ),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel',
                  style: TextStyle(color: AppColors.textTertiary))),
          ElevatedButton(
            onPressed: () async {
              if (emailCtrl.text.trim().isNotEmpty) {
                await ref.read(settingsRepositoryProvider).shareDevice(
                  deviceId,
                  CreateShareRequest(
                    email: emailCtrl.text.trim(),
                    permissionLevel: 'VIEW',
                  ),
                );
                ref.invalidate(deviceSharesProvider(deviceId));
                if (context.mounted) {
                  Navigator.pop(context);
                  Navigator.pop(context);
                }
              }
            },
            child: const Text('Invite'),
          ),
        ],
      ),
    );
  }
}

// ─── Tickets Sheet ────────────────────────────────────────────────────────────

class _TicketsSheet extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Simple view — full tickets screen would be a separate route
    return const Padding(
      padding: EdgeInsets.all(Spacing.lg),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('My Tickets',
              style: TextStyle(color: AppColors.textPrimary,
                  fontWeight: FontWeight.w700, fontSize: 18)),
          SizedBox(height: Spacing.md),
          // TODO: FutureProvider<List<SupportTicket>> for ticket list
          Text('View tickets from your account portal.',
              style: TextStyle(color: AppColors.textTertiary, fontSize: 12),
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

// ─── Create Ticket Sheet ──────────────────────────────────────────────────────

class _CreateTicketSheet extends ConsumerStatefulWidget {
  final String? deviceId;
  const _CreateTicketSheet({this.deviceId});

  @override
  ConsumerState<_CreateTicketSheet> createState() =>
      _CreateTicketSheetState();
}

class _CreateTicketSheetState extends ConsumerState<_CreateTicketSheet> {
  final _subjectCtrl = TextEditingController();
  final _descCtrl = TextEditingController();
  TicketCategory _category = TicketCategory.general;
  bool _saving = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: Spacing.lg, right: Spacing.lg, top: Spacing.lg,
        bottom: MediaQuery.of(context).viewInsets.bottom + Spacing.lg,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('New Support Ticket',
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: Spacing.md),
          DropdownButtonFormField<TicketCategory>(
            initialValue: _category,
            dropdownColor: AppColors.surfaceDark,
            style: const TextStyle(color: AppColors.textPrimary),
            decoration: AppDecorations.inputDecoration(
                label: 'Category', icon: Icons.category_outlined),
            items: TicketCategory.values
                .map((c) => DropdownMenuItem(
                    value: c,
                    child: Text(c.name.toUpperCase())))
                .toList(),
            onChanged: (v) => setState(() => _category = v!),
          ),
          const SizedBox(height: Spacing.sm),
          TextFormField(
            controller: _subjectCtrl,
            style: const TextStyle(color: AppColors.textPrimary),
            decoration: AppDecorations.inputDecoration(
                label: 'Subject', icon: Icons.subject),
          ),
          const SizedBox(height: Spacing.sm),
          TextFormField(
            controller: _descCtrl,
            maxLines: 3,
            style: const TextStyle(color: AppColors.textPrimary),
            decoration: AppDecorations.inputDecoration(
                label: 'Description', icon: Icons.description_outlined),
          ),
          const SizedBox(height: Spacing.md),
          ElevatedButton(
            onPressed: _saving ? null : _submit,
            child: _saving
                ? const SizedBox(width: 18, height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                : const Text('Submit Ticket'),
          ),
        ],
      ),
    );
  }

  Future<void> _submit() async {
    if (_subjectCtrl.text.trim().isEmpty) return;
    setState(() => _saving = true);
    try {
      await ref.read(settingsRepositoryProvider).createTicket(
        CreateTicketRequest(
          subject: _subjectCtrl.text.trim(),
          description: _descCtrl.text.trim(),
          category: _category,
          deviceId: widget.deviceId,
        ),
      );
      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Ticket submitted. Our team will respond shortly.')));
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }
}
