import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

// ─────────────────────────────────────────────────────────────────────────────
// SANITIZER INTERCEPTOR
// Strips sensitive headers/data BEFORE logging to Crashlytics.
// 🚫 NEVER logs: Authorization, Cookie, refreshToken, paymentUrl, email, phone
// ─────────────────────────────────────────────────────────────────────────────

class SanitizerInterceptor extends Interceptor {
  static const _sensitiveHeaders = ['authorization', 'cookie', 'x-refresh-token'];
  static const _sensitiveBodyKeys = ['password', 'token', 'refreshToken', 'paymentUrl'];

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // 1. Strip auth headers before any logging
    final safeHeaders = Map<String, dynamic>.from(err.requestOptions.headers)
      ..removeWhere((key, _) => _sensitiveHeaders.contains(key.toLowerCase()));

    // 2. Safe log info — path, method, status only
    final logInfo = [
      'method: ${err.requestOptions.method}',
      'path: ${err.requestOptions.path}',
      'status: ${err.response?.statusCode}',
    ];

    // 3. Only log non-network errors (network errors are expected offline)
    if (err.type != DioExceptionType.connectionError &&
        err.type != DioExceptionType.receiveTimeout) {
      FirebaseCrashlytics.instance.recordError(
        'API Error ${err.response?.statusCode}',
        err.stackTrace,
        reason: 'DioException: ${err.requestOptions.path}',
        information: logInfo,
        fatal: false,
      );
    }

    handler.next(err); // Always pass through — don't swallow errors
  }
}
