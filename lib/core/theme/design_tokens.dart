import 'package:flutter/material.dart';

// ─────────────────────────────────────────────────────────────────────────────
// DESIGN TOKENS — Extracted from HTML reference: stich/water_tank_flutter_app_ui
// All values are exact matches from the Tailwind config in the HTML mockups.
// DO NOT use raw Color/double literals in widgets — always reference these tokens.
// ─────────────────────────────────────────────────────────────────────────────

class AppColors {
  AppColors._();

  // ─── Primary Brand ───
  static const primary     = Color(0xFF137FEC); // #137fec — buttons, links, active
  static const primaryDark = Color(0xFF0B5DB0); // #0b5db0 — pressed state

  // ─── Backgrounds ───
  static const bgDark    = Color(0xFF111418); // #111418 — main scaffold (dashboard/home)
  static const bgDarkAlt = Color(0xFF101922); // #101922 — alt scaffold (billing, provisioning)

  // ─── Surfaces (layered depth) ───
  static const surfaceDark      = Color(0xFF1C2127); // #1c2127 — input fields, modals
  static const surfaceCard      = Color(0xFF232930); // #232930 — elevated cards
  static const surfaceHighlight = Color(0xFF283039); // #283039 — borders, dividers, toggles

  // ─── Semantic ───
  static const success = Color(0xFF22C55E); // green-500 — toggle ON, motor standby
  static const warning = Color(0xFFF59E0B); // amber-500 — billing alerts, power usage
  static const danger  = Color(0xFFEF4444); // red-500   — critical level, errors

  // ─── Text ───
  static const textPrimary   = Color(0xFFFFFFFF); // white
  static const textSecondary = Color(0xFF94A3B8); // slate-400
  static const textTertiary  = Color(0xFF64748B); // slate-500
  static const textDisabled  = Color(0xFF475569); // slate-600

  // ─── Water Tank ───
  static const tankBackground = Color(0xFF1E242B); // tank cylinder bg
  static const waterBlue      = Color(0xFF137FEC); // water level (normal)
  static const waterDanger    = Color(0xFFEF4444); // water level (critical)

  // ─── Water Level Thresholds (referenced by InteractiveTank) ───
  static const waterFull = Color(0xFF22C55E); // ≥60%: green — healthy
  static const waterMid  = Color(0xFFF59E0B); // 30-59%: amber — caution
  static const waterLow  = Color(0xFFEF4444); // <30%: red — critical
}

// ─────────────────────────────────────────────────────────────────
// SPACING — matches Tailwind: p-1=4, p-2=8, p-4=16, p-6=24, p-8=32
// ─────────────────────────────────────────────────────────────────
class Spacing {
  Spacing._();

  static const double xs = 4.0;  // Badge padding, icon-to-text
  static const double sm = 8.0;  // Small gaps, toolbar items
  static const double md = 16.0; // Card padding, standard sections
  static const double lg = 24.0; // Screen horizontal padding
  static const double xl = 32.0; // Section separators
}

// ─────────────────────────────────────────────────────────────────
// RADIUS — Named AppRadius to avoid conflict with Flutter's Radius class
// ─────────────────────────────────────────────────────────────────
class AppRadius {
  AppRadius._();

  static const double sm   = 8.0;   // Form inputs, small chips (rounded-lg)
  static const double md   = 12.0;  // Buttons (rounded-xl)
  static const double lg   = 16.0;  // Surface cards (rounded-2xl)
  static const double xl   = 20.0;  // Bottom sheets, tank cards
  static const double xxl  = 24.0;  // Login frosted card (rounded-3xl)
  static const double full = 999.0; // Pills, badges, avatars (rounded-full)
}

// ─────────────────────────────────────────────────────────────────
// DURATIONS — Centralized animation timing
// ─────────────────────────────────────────────────────────────────
class AppDurations {
  AppDurations._();

  static const fast   = Duration(milliseconds: 150); // Micro-interactions, ripples
  static const normal = Duration(milliseconds: 300); // Page transitions, state changes
  static const slow   = Duration(milliseconds: 500); // Water level fill, cache→live

  static const intentTimeout   = Duration(seconds: 5); // Motor ACK before ERROR state
  static const debounceDefault = Duration(seconds: 2);  // Form submit debounce
  static const mqttDebounce    = Duration(milliseconds: 500); // App lifecycle debounce
}

// ─────────────────────────────────────────────────────────────────
// SHADOWS — Composable BoxShadow tokens
// ─────────────────────────────────────────────────────────────────
class AppShadows {
  AppShadows._();

  static final card = BoxShadow(
    color: Colors.black.withOpacity(0.20),
    blurRadius: 8,
    offset: const Offset(0, 4),
  );

  static final elevated = BoxShadow(
    color: Colors.black.withOpacity(0.30),
    blurRadius: 16,
    offset: const Offset(0, 8),
  );

  // Used on primary buttons (shadow-primary/20)
  static final primaryGlow = BoxShadow(
    color: AppColors.primary.withOpacity(0.20),
    blurRadius: 12,
    offset: const Offset(0, 4),
  );

  // Used on danger/alert cards (shadow-danger/5)
  static final dangerGlow = BoxShadow(
    color: AppColors.danger.withOpacity(0.10),
    blurRadius: 8,
    offset: const Offset(0, 2),
  );
}
