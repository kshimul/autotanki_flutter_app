import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/auth_repository.dart';
import 'auth_state.dart';

// ─────────────────────────────────────────────────────────────────────────────
// AUTH NOTIFIER
// Manages the full auth lifecycle: cold start check, login, register, logout.
// State drives GoRouter redirect in route_guards.dart.
// ─────────────────────────────────────────────────────────────────────────────

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository _repo;

  AuthNotifier(this._repo) : super(const AuthState.initial()) {
    _checkExistingSession();
  }

  // ── Cold start: check for existing tokens & restore user ─────────────────
  Future<void> _checkExistingSession() async {
    final hasSession = await _repo.hasSession();
    if (!hasSession) {
      state = const AuthState.unauthenticated();
      return;
    }
    try {
      // Refresh user from server (token still valid)
      final user = await _repo.getMe();
      state = AuthState.authenticated(user);
    } catch (_) {
      // Server unreachable — use cached user for offline display
      final cached = await _repo.getCachedUser();
      if (cached != null) {
        state = AuthState.authenticated(cached);
      } else {
        state = const AuthState.unauthenticated();
      }
    }
  }

  // ── Login ─────────────────────────────────────────────────────────────────
  Future<void> login({
    required String email,
    required String password,
  }) async {
    state = const AuthState.loading();
    try {
      final user = await _repo.login(email: email, password: password);
      state = AuthState.authenticated(user);
    } on DioException catch (e) {
      state = AuthState.error(_parseError(e));
    } catch (e, st) {
      print('Login error: $e\n$st');
      state = AuthState.error('Error: $e');
    }
  }

  // ── Register ──────────────────────────────────────────────────────────────
  Future<void> register({
    required String fullName,
    required String email,
    required String password,
    String? phone,
  }) async {
    state = const AuthState.loading();
    try {
      final user = await _repo.register(
        fullName: fullName,
        email: email,
        password: password,
        phone: phone,
      );
      state = AuthState.authenticated(user);
    } on DioException catch (e) {
      state = AuthState.error(_parseError(e));
    } catch (e, st) {
      print('Registration error: $e\n$st');
      state = AuthState.error('Registration error: $e');
    }
  }

  // ── Logout ────────────────────────────────────────────────────────────────
  Future<void> logout() async {
    await _repo.logout();
    state = const AuthState.unauthenticated();
  }

  // ── Forgot password ───────────────────────────────────────────────────────
  Future<bool> forgotPassword(String email) async {
    state = const AuthState.loading();
    try {
      await _repo.forgotPassword(email);
      state = const AuthState.unauthenticated();
      return true;
    } on DioException catch (e) {
      state = AuthState.error(_parseError(e));
      return false;
    }
  }

  // ── Error message parser ──────────────────────────────────────────────────
  String _parseError(DioException e) {
    final statusCode = e.response?.statusCode;
    if (statusCode == 401) return 'ইমেইল বা পাসওয়ার্ড ভুল'; // Invalid credentials
    if (statusCode == 409) return 'এই ইমেইল দিয়ে আগেই অ্যাকাউন্ট আছে'; // Already registered
    if (statusCode == 422) return 'তথ্য সঠিক নয়, আবার চেষ্টা করুন'; // Validation error
    if (e.type == DioExceptionType.connectionError) {
      return 'ইন্টারনেট সংযোগ নেই'; // No internet
    }
    return 'সার্ভার সমস্যা। একটু পরে আবার চেষ্টা করুন'; // Server error
  }
}

final authNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref.watch(authRepositoryProvider));
});
