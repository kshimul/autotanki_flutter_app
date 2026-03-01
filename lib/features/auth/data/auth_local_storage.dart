import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert';
import '../../../shared/models/user_model.dart';

// ─────────────────────────────────────────────────────────────────────────────
// AUTH LOCAL STORAGE
// All tokens encrypted via Keychain (iOS) / Keystore (Android).
// User profile cached as JSON for offline display.
// ─────────────────────────────────────────────────────────────────────────────

class AuthLocalStorage {
  static const _store = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
  );

  static const _kAccessToken  = 'auth_access_token';
  static const _kRefreshToken = 'auth_refresh_token';
  static const _kUser         = 'auth_user_json';

  // ─── Tokens ──────────────────────────────────────────────────────────────
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await Future.wait([
      _store.write(key: _kAccessToken, value: accessToken),
      _store.write(key: _kRefreshToken, value: refreshToken),
    ]);
  }

  Future<String?> getAccessToken() async {
    try {
      return await _store.read(key: _kAccessToken);
    } catch (_) {
      await clearAll();
      return null;
    }
  }

  Future<String?> getRefreshToken() async {
    try {
      return await _store.read(key: _kRefreshToken);
    } catch (_) {
      await clearAll();
      return null;
    }
  }

  Future<bool> hasSession() async {
    try {
      final token = await _store.read(key: _kAccessToken);
      return token != null && token.isNotEmpty;
    } catch (_) {
      await clearAll();
      return false;
    }
  }

  // ─── User profile cache ───────────────────────────────────────────────────
  Future<void> saveUser(User user) async {
    try {
      await _store.write(key: _kUser, value: jsonEncode(user.toJson()));
    } catch (_) {}
  }

  Future<User?> getUser() async {
    try {
      final raw = await _store.read(key: _kUser);
      if (raw == null) return null;
      return User.fromJson(jsonDecode(raw) as Map<String, dynamic>);
    } catch (_) {
      await clearAll();
      return null;
    }
  }

  // ─── Clear all (logout) ───────────────────────────────────────────────────
  Future<void> clearAll() async {
    try {
      await Future.wait([
        _store.delete(key: _kAccessToken),
        _store.delete(key: _kRefreshToken),
        _store.delete(key: _kUser),
      ]);
    } catch (_) {
      try {
        await _store.deleteAll();
      } catch (_) {}
    }
  }
}

final authLocalStorageProvider = Provider<AuthLocalStorage>(
  (_) => AuthLocalStorage(),
);
