import 'package:flutter/material.dart';
import 'design_tokens.dart';

// ─────────────────────────────────────────────────────────────────────────────
// APP DECORATIONS — Reusable BoxDecoration + InputDecoration factories
// Usage: Container(decoration: AppDecorations.surfaceCard())
// ─────────────────────────────────────────────────────────────────────────────

class AppDecorations {
  AppDecorations._();

  // ── Standard surface card (dashboard, billing, schedule) ──────────────────
  // Matches: bg-surface-card rounded-2xl border border-surface-highlight/50 shadow-lg
  static BoxDecoration surfaceCard() => BoxDecoration(
        color: AppColors.surfaceCard,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(
          color: AppColors.surfaceHighlight.withOpacity(0.5),
        ),
        boxShadow: [AppShadows.card],
      );

  // ── Elevated card (subscription plan, modal) ──────────────────────────────
  static BoxDecoration elevatedCard() => BoxDecoration(
        color: AppColors.surfaceDark,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: AppColors.surfaceHighlight),
        boxShadow: [AppShadows.elevated],
      );

  // ── Frosted glass card (login/signup) ─────────────────────────────────────
  // Matches: bg-surface-card/60 backdrop-blur-md border rounded-3xl
  // Pair with: ClipRRect + BackdropFilter(filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12))
  static BoxDecoration frostedCard() => BoxDecoration(
        color: AppColors.surfaceCard.withOpacity(0.6),
        borderRadius: BorderRadius.circular(AppRadius.xxl),
        border: Border.all(
          color: AppColors.surfaceHighlight.withOpacity(0.5),
        ),
      );

  // ── Alert / warning banner ────────────────────────────────────────────────
  // Matches: bg-gradient-to-r from-danger/20 to-danger/5 border border-danger/30
  static BoxDecoration alertBanner(Color color) => BoxDecoration(
        gradient: LinearGradient(
          colors: [color.withOpacity(0.20), color.withOpacity(0.05)],
        ),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: color.withOpacity(0.30)),
        boxShadow: [AppShadows.dangerGlow],
      );

  // ── Status badge background ───────────────────────────────────────────────
  // Matches: bg-primary/10 rounded-full (inline pill badge)
  static BoxDecoration statusBadge(Color color) => BoxDecoration(
        color: color.withOpacity(0.10),
        borderRadius: BorderRadius.circular(AppRadius.full),
        border: Border.all(color: color.withOpacity(0.20)),
      );

  // ── Segment control / tab selector ───────────────────────────────────────
  // Matches: bg-surface-dark rounded-xl (app mode selector outer)
  static BoxDecoration segmentedControl() => BoxDecoration(
        color: AppColors.surfaceDark,
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(color: AppColors.surfaceHighlight),
      );

  // ── Active segment pill ───────────────────────────────────────────────────
  static BoxDecoration activeSegment() => BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(AppRadius.md - 2),
        boxShadow: [AppShadows.primaryGlow],
      );

  // ─────────────────────────────────────────────────────────────────────────
  // INPUT DECORATION
  // Matches: bg-surface-dark rounded-xl focus:ring-2 focus:ring-primary
  // ─────────────────────────────────────────────────────────────────────────

  static InputDecoration inputDecoration({
    required String label,
    required IconData icon,
    String? hint,
    Widget? suffixIcon,
  }) =>
      InputDecoration(
        labelText: label,
        hintText: hint,
        labelStyle: const TextStyle(
          color: AppColors.textTertiary,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        hintStyle: const TextStyle(color: AppColors.textDisabled),
        prefixIcon: Icon(icon, color: AppColors.textTertiary, size: 20),
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: AppColors.surfaceDark,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: Spacing.md,
          vertical: Spacing.md,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: const BorderSide(color: AppColors.danger, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: const BorderSide(color: AppColors.danger, width: 2),
        ),
        errorStyle: const TextStyle(
          color: AppColors.danger,
          fontSize: 11,
        ),
      );
}
