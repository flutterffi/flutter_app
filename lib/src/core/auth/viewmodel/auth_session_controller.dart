import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter_app/src/core/auth/model/auth_session.dart';
import 'package:flutter_app/src/core/auth/service/auth_repository.dart';
import 'package:flutter_app/src/core/auth/service/auth_session_repository.dart';

part 'auth_session_controller.g.dart';

@riverpod
class AuthSessionController extends _$AuthSessionController {
  @override
  Future<AuthSession?> build() async {
    final repository = ref.watch(authSessionRepositoryProvider);
    return repository.restore();
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    final authRepository = ref.read(authRepositoryProvider);
    final sessionRepository = ref.read(authSessionRepositoryProvider);

    final session = await authRepository.login(
      email: email,
      password: password,
    );
    await sessionRepository.save(session);
    state = AsyncData(session);
  }

  Future<void> logout() async {
    final sessionRepository = ref.read(authSessionRepositoryProvider);
    await sessionRepository.clear();
    state = const AsyncData(null);
  }
}
