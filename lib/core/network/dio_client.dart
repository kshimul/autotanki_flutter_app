import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../utils/env_config.dart';
import 'api_constants.dart';
import 'sanitizer_interceptor.dart';

// ─────────────────────────────────────────────────────────────────────────────
// DIO HTTP CLIENT
// - QueuedInterceptorsWrapper for race-safe token refresh
// - Refresh-loop guard (400/401 on /auth/refresh → logout)
// - SanitizerInterceptor strips PII before Crashlytics
// ─────────────────────────────────────────────────────────────────────────────

const _secureStorage = FlutterSecureStorage(
  aOptions: AndroidOptions(encryptedSharedPreferences: true),
  iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
);

const _accessTokenKey  = 'auth_access_token';
const _refreshTokenKey = 'auth_refresh_token';

Dio createDio() {
  final dio = Dio(
    BaseOptions(
      baseUrl: EnvConfig.baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
      headers: {'Content-Type': 'application/json; charset=utf-8'},
    ),
  );

  dio.interceptors.addAll([
    _AuthInterceptor(dio),
    SanitizerInterceptor(),
  ]);

  return dio;
}

// ─────────────────────────────────────────────────────────────────────────────
// AUTH INTERCEPTOR — QueuedInterceptorsWrapper for thread-safe token refresh
// ─────────────────────────────────────────────────────────────────────────────

class _AuthInterceptor extends QueuedInterceptorsWrapper {
  final Dio _dio;
  bool _isRefreshing = false;

  _AuthInterceptor(this._dio);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _secureStorage.read(key: _accessTokenKey);
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final isUnauthorized = err.response?.statusCode == 401;
    final isRefreshEndpoint = err.requestOptions.path == ApiConstants.refresh;

    // Refresh-loop guard: 401 on the refresh endpoint itself → logout
    if (isUnauthorized && isRefreshEndpoint) {
      await _clearTokens();
      // TODO: Navigate to login via GoRouter (inject ref if needed)
      handler.next(err);
      return;
    }

    if (isUnauthorized && !_isRefreshing) {
      _isRefreshing = true;
      try {
        final newToken = await _refreshAccessToken();
        if (newToken != null) {
          // Retry original request with new token
          final retryOptions = err.requestOptions
            ..headers['Authorization'] = 'Bearer $newToken';
          final response = await _dio.fetch(retryOptions);
          handler.resolve(response);
        } else {
          handler.next(err);
        }
      } catch (_) {
        await _clearTokens();
        handler.next(err);
      } finally {
        _isRefreshing = false;
      }
    } else {
      handler.next(err);
    }
  }

  Future<String?> _refreshAccessToken() async {
    final refreshToken = await _secureStorage.read(key: _refreshTokenKey);
    if (refreshToken == null) return null;

    try {
      // Use a fresh Dio instance to avoid interceptor recursion
      final refreshDio = Dio(BaseOptions(baseUrl: EnvConfig.baseUrl));
      final response = await refreshDio.post(
        ApiConstants.refresh,
        data: {'refreshToken': refreshToken},
      );
      final newAccessToken = response.data['accessToken'] as String?;
      final newRefreshToken = response.data['refreshToken'] as String?;

      if (newAccessToken != null) {
        await _secureStorage.write(key: _accessTokenKey, value: newAccessToken);
      }
      if (newRefreshToken != null) {
        await _secureStorage.write(key: _refreshTokenKey, value: newRefreshToken);
      }
      return newAccessToken;
    } catch (_) {
      return null;
    }
  }

  Future<void> _clearTokens() async {
    await _secureStorage.delete(key: _accessTokenKey);
    await _secureStorage.delete(key: _refreshTokenKey);
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// RIVERPOD PROVIDER
// ─────────────────────────────────────────────────────────────────────────────

final dioProvider = Provider<Dio>((ref) => createDio());
