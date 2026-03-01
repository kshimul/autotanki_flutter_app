import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'shared/models/telemetry_cache.dart';
import 'shared/models/device_cache.dart';
import 'features/dashboard/data/telemetry_cache_repository.dart';

// ─────────────────────────────────────────────────────────────────────────────
// MAIN — Entry point
// ─────────────────────────────────────────────────────────────────────────────

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ─── Firebase ─────────────────────────────────────────────────────────────
  // google-services.json must exist in android/app/ for this to work.
  // Without it, the app still runs but crash reporting is disabled.
  bool firebaseReady = false;
  try {
    await Firebase.initializeApp();
    firebaseReady = true;
  } catch (e) {
    debugPrint('⚠️  Firebase.initializeApp() failed: $e');
    debugPrint('    Ensure google-services.json is in android/app/ and your');
    debugPrint('    Firebase project matches the applicationId in build.gradle.kts');
  }

  // ─── Crashlytics: capture Flutter framework errors ────────────────────────
  if (firebaseReady) {
    FlutterError.onError = (errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    };
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }

  // ─── Isar: open database ──────────────────────────────────────────────────
  // Isar native .so must be included in the APK. If it fails, we continue
  // without local telemetry cache (non-fatal).
  Isar? isar;
  try {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [TelemetryCacheSchema, DeviceCacheSchema],
      directory: dir.path,
      name: 'smarttank_cache',
    );
    // Run 30-day telemetry retention prune on startup
    await TelemetryCacheRepository(isar).pruneOldTelemetry();
  } catch (e) {
    debugPrint('⚠️  Isar failed to open: $e');
    debugPrint('    Telemetry local cache disabled. App will function normally.');
  }

  runApp(
    ProviderScope(
      overrides: [
        if (isar != null) isarProvider.overrideWithValue(isar),
      ],
      child: const SmartTankApp(),
    ),
  );
}

class SmartTankApp extends ConsumerWidget {
  const SmartTankApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'SmartTank',
      debugShowCheckedModeBanner: false,

      // Dark-only theme from HTML reference
      theme: AppTheme.dark,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.dark,

      routerConfig: router,
    );
  }
}
