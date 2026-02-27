import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/network/api_constants.dart';
import '../../../core/network/dio_client.dart';
import '../../../shared/models/user_model.dart';
import 'auth_local_storage.dart';

// ─────────────────────────────────────────────────────────────────────────────
// AUTH REPOSITORY — All server calls for auth feature
// ─────────────────────────────────────────────────────────────────────────────

class AuthRepository {
  final Dio _dio;
  final AuthLocalStorage _localStorage;

  AuthRepository(this._dio, this._localStorage);

  // ─── Login ────────────────────────────────────────────────────────────────
  Future<User> login({
    required String email,
    required String password,
  }) async {
    final response = await _dio.post(
      ApiConstants.login,
      data: {'email': email, 'password': password},
    );
    final rawData = response.data as Map<String, dynamic>;
    final data = rawData['data'] as Map<String, dynamic>? ?? rawData;
    
    final accessToken = data['accessToken'] as String?;
    final refreshToken = data['refreshToken'] as String?;
    if (accessToken != null && refreshToken != null) {
      await _localStorage.saveTokens(
        accessToken: accessToken,
        refreshToken: refreshToken,
      );
    }

    final userJson = data.containsKey('user')
        ? data['user'] as Map<String, dynamic>
        : data;
        
    // In case any timestamps are stripped
    if (!userJson.containsKey('updatedAt') && userJson.containsKey('createdAt')) {
      userJson['updatedAt'] = userJson['createdAt'];
    }

    final user = User.fromJson(userJson);
    await _localStorage.saveUser(user);
    return user;
  }

  // ─── Register ─────────────────────────────────────────────────────────────
  Future<User> register({
    required String fullName,
    required String email,
    required String password,
    String? phone,
  }) async {
    final response = await _dio.post(
      ApiConstants.register,
      data: {
        'fullName': fullName,
        'email': email,
        'password': password,
        if (phone != null) 'phone': phone,
      },
    );
    final rawData = response.data as Map<String, dynamic>;
    final data = rawData['data'] as Map<String, dynamic>? ?? rawData;
    
    // Optional tokens — registration might not authenticate immediately
    final accessToken = data['accessToken'] as String?;
    final refreshToken = data['refreshToken'] as String?;
    if (accessToken != null && refreshToken != null) {
      await _localStorage.saveTokens(
        accessToken: accessToken,
        refreshToken: refreshToken,
      );
    }
    
    // User might be nested under 'user' or just be the root object
    final userJson = data.containsKey('user')
        ? data['user'] as Map<String, dynamic>
        : data;
    
    // Remove updatedAt if missing because Freezed throws if a required field is null
    if (!userJson.containsKey('updatedAt') && userJson.containsKey('createdAt')) {
      userJson['updatedAt'] = userJson['createdAt'];
    }
    
    final user = User.fromJson(userJson);
    await _localStorage.saveUser(user);
    return user;
  }

  // ─── Get current user ─────────────────────────────────────────────────────
  Future<User> getMe() async {
    final response = await _dio.get(ApiConstants.me);
    final rawData = response.data as Map<String, dynamic>;
    final data = rawData['data'] as Map<String, dynamic>? ?? rawData;
    
    final userJson = data.containsKey('user')
        ? data['user'] as Map<String, dynamic>
        : data;
        
    final user = User.fromJson(userJson);
    await _localStorage.saveUser(user);
    return user;
  }

  // ─── Logout ───────────────────────────────────────────────────────────────
  Future<void> logout() async {
    try {
      // Delete FCM token from server before clearing local tokens
      await _dio.delete(ApiConstants.fcmToken);
      await _dio.post(ApiConstants.logout);
    } catch (_) {
      // Server call fails when offline — still clear local state
    } finally {
      await _localStorage.clearAll();
    }
  }

  // ─── Forgot password ──────────────────────────────────────────────────────
  Future<void> forgotPassword(String email) async {
    await _dio.post(ApiConstants.forgotPassword, data: {'email': email});
  }

  // ─── FCM Token registration ────────────────────────────────────────────────
  Future<void> registerFcmToken({
    required String token,
    required String platform, // 'android' | 'ios'
  }) async {
    await _dio.post(
      ApiConstants.fcmToken,
      data: {'token': token, 'platform': platform},
    );
  }

  // ─── Cached user (offline/fast start) ────────────────────────────────────
  Future<User?> getCachedUser() => _localStorage.getUser();
  Future<bool> hasSession() => _localStorage.hasSession();
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(
    ref.watch(dioProvider),
    ref.watch(authLocalStorageProvider),
  );
});
