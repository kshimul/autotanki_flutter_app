import 'package:flutter/material.dart';
import '../../core/theme/design_tokens.dart';

// ─────────────────────────────────────────────────────────────────────────────
// RENAME DEVICE DIALOG
// A reusable bottom sheet / dialog to capture a new nickname for a device.
// Returns the typed string, or null if cancelled.
// ─────────────────────────────────────────────────────────────────────────────

class RenameDeviceDialog extends StatefulWidget {
  final String initialName;

  const RenameDeviceDialog({super.key, required this.initialName});

  static Future<String?> show(BuildContext context, {required String initialName}) {
    return showDialog<String>(
      context: context,
      builder: (context) => RenameDeviceDialog(initialName: initialName),
    );
  }

  @override
  State<RenameDeviceDialog> createState() => _RenameDeviceDialogState();
}

class _RenameDeviceDialogState extends State<RenameDeviceDialog> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialName);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.bgDark,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.lg),
        side: const BorderSide(color: AppColors.surfaceHighlight),
      ),
      title: const Text(
        'Rename Device',
        style: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      content: TextField(
        controller: _controller,
        autofocus: true,
        style: const TextStyle(color: AppColors.textPrimary),
        decoration: InputDecoration(
          hintText: 'e.g. Home Water Tank',
          hintStyle: const TextStyle(color: AppColors.textTertiary),
          filled: true,
          fillColor: AppColors.surfaceDark,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
            borderSide: const BorderSide(color: AppColors.primary),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: Spacing.md,
            vertical: Spacing.sm,
          ),
        ),
        textInputAction: TextInputAction.done,
        onSubmitted: (value) {
          Navigator.of(context).pop(value.trim());
        },
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel', style: TextStyle(color: AppColors.textSecondary)),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(_controller.text.trim());
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.textPrimary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
          ),
          child: const Text('Save', style: TextStyle(fontWeight: FontWeight.w700)),
        ),
      ],
    );
  }
}
