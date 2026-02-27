import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_tanki_app/features/auth/application/auth_notifier.dart';
import 'package:auto_tanki_app/features/auth/application/auth_state.dart';
import 'package:auto_tanki_app/features/auth/data/auth_repository.dart';
import 'package:auto_tanki_app/shared/models/user_model.dart';

@GenerateMocks([AuthRepository])
import 'auth_notifier_test.mocks.dart';

// ─────────────────────────────────────────────────────────────────────────────
// AUTH NOTIFIER UNIT TESTS
// Uses Freezed maybeWhen() for pattern matching on sealed states.
// AuthNotifier calls _checkExistingSession() in the constructor — tests prime
// the mock BEFORE creating the ProviderContainer, then pump microtasks.
// ─────────────────────────────────────────────────────────────────────────────

void main() {
  late MockAuthRepository mockRepo;

  final testUser = User(
    id: 'user-123',
    email: 'test@gmail.com',
    fullName: 'Test User',
    role: UserRole.user,
    createdAt: DateTime(2024, 1, 1),
    updatedAt: DateTime(2024, 1, 1),
  );

  // ─── State helpers (avoid private Freezed types) ──────────────────────────
  bool isAuthenticated(AuthState s) =>
      s.maybeWhen(authenticated: (_) => true, orElse: () => false);
  bool isUnauthenticated(AuthState s) =>
      s.maybeWhen(unauthenticated: () => true, orElse: () => false);
  bool isLoading(AuthState s) =>
      s.maybeWhen(loading: () => true, orElse: () => false);
  bool isError(AuthState s) =>
      s.maybeWhen(error: (_) => true, orElse: () => false);

  // Build container — AuthNotifier starts running _checkExistingSession() in ctor
  ProviderContainer buildContainer() => ProviderContainer(
        overrides: [authRepositoryProvider.overrideWithValue(mockRepo)],
      );

  setUp(() {
    mockRepo = MockAuthRepository();
  });

  // ─── Cold start (constructor-driven session check) ────────────────────────
  group('AuthNotifier — cold start', () {
    test('authenticated when token exists and getMe succeeds', () async {
      when(mockRepo.hasSession()).thenAnswer((_) async => true);
      when(mockRepo.getMe()).thenAnswer((_) async => testUser);

      final c = buildContainer();
      addTearDown(c.dispose);
      await Future.microtask(() {}); // Pump constructor async

      final state = c.read(authNotifierProvider);
      expect(isAuthenticated(state), isTrue);
      final user = state.maybeWhen(authenticated: (u) => u, orElse: () => null);
      expect(user?.email, equals('test@gmail.com'));
    });

    test('unauthenticated when no valid session', () async {
      when(mockRepo.hasSession()).thenAnswer((_) async => false);

      final c = buildContainer();
      addTearDown(c.dispose);
      await Future.microtask(() {});

      expect(isUnauthenticated(c.read(authNotifierProvider)), isTrue);
    });

    test('falls back to cached user when server unreachable', () async {
      when(mockRepo.hasSession()).thenAnswer((_) async => true);
      when(mockRepo.getMe()).thenThrow(Exception('No internet'));
      when(mockRepo.getCachedUser()).thenAnswer((_) async => testUser);

      final c = buildContainer();
      addTearDown(c.dispose);
      await Future.microtask(() {});

      expect(isAuthenticated(c.read(authNotifierProvider)), isTrue);
    });

    test('unauthenticated when server fails and no cached user', () async {
      when(mockRepo.hasSession()).thenAnswer((_) async => true);
      when(mockRepo.getMe()).thenThrow(Exception('No internet'));
      when(mockRepo.getCachedUser()).thenAnswer((_) async => null);

      final c = buildContainer();
      addTearDown(c.dispose);
      await Future.microtask(() {});

      expect(isUnauthenticated(c.read(authNotifierProvider)), isTrue);
    });
  });

  // ─── Login ────────────────────────────────────────────────────────────────
  group('AuthNotifier — login', () {
    late ProviderContainer c;

    setUp(() async {
      when(mockRepo.hasSession()).thenAnswer((_) async => false);
      c = buildContainer();
      await Future.microtask(() {}); // Let cold-start finish (→ unauthenticated)
    });

    tearDown(() => c.dispose());

    test('authenticated on success', () async {
      when(mockRepo.login(email: anyNamed('email'), password: anyNamed('password')))
          .thenAnswer((_) async => testUser);

      await c.read(authNotifierProvider.notifier).login(
            email: 'test@gmail.com',
            password: 'pass1234',
          );

      expect(isAuthenticated(c.read(authNotifierProvider)), isTrue);
    });

    test('error state on server rejection', () async {
      when(mockRepo.login(email: anyNamed('email'), password: anyNamed('password')))
          .thenThrow(Exception('401 Invalid credentials'));

      await c.read(authNotifierProvider.notifier).login(
            email: 'wrong@gmail.com',
            password: 'bad',
          );

      expect(isError(c.read(authNotifierProvider)), isTrue);
    });

    test('transitions through loading state', () async {
      final states = <AuthState>[];
      final sub = c.listen(authNotifierProvider, (_, s) => states.add(s));

      when(mockRepo.login(email: anyNamed('email'), password: anyNamed('password')))
          .thenAnswer((_) async {
        await Future.delayed(const Duration(milliseconds: 50));
        return testUser;
      });

      await c.read(authNotifierProvider.notifier).login(
            email: 'test@gmail.com',
            password: 'pass1234',
          );

      sub.close();
      expect(states.any(isLoading), isTrue, reason: 'Must pass through loading');
      expect(isAuthenticated(states.last), isTrue);
    });
  });

  // ─── Logout ───────────────────────────────────────────────────────────────
  group('AuthNotifier — logout', () {
    test('unauthenticated state after logout', () async {
      when(mockRepo.hasSession()).thenAnswer((_) async => true);
      when(mockRepo.getMe()).thenAnswer((_) async => testUser);

      final c = buildContainer();
      addTearDown(c.dispose);
      await Future.microtask(() {});
      expect(isAuthenticated(c.read(authNotifierProvider)), isTrue);

      when(mockRepo.logout()).thenAnswer((_) async {});
      await c.read(authNotifierProvider.notifier).logout();

      expect(isUnauthenticated(c.read(authNotifierProvider)), isTrue);
    });
  });
}
