import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter_app/src/core/auth/model/auth_session.dart';
import 'package:flutter_app/src/core/auth/service/auth_session_repository.dart';
import 'package:flutter_app/src/modules/profile/model/profile_model.dart';

part 'profile_viewmodel.g.dart';

@riverpod
class ProfileViewmodel extends _$ProfileViewmodel {
  @override
  Future<ProfileModel> build() async {
    const baseState = ProfileModel(
      title: 'Login',
      subtitle: 'Sign in to sync settings, workspace progress, and team context.',
      email: '',
      password: '',
      isPasswordVisible: false,
      isLoggedIn: false,
      isRestoringSession: true,
      errorMessage: null,
    );

    final repository = _repositoryOrNull();
    final session = repository == null ? null : await repository.restore();

    return baseState.copyWith(
      email: session?.email ?? '',
      isLoggedIn: session != null,
      isRestoringSession: false,
    );
  }

  ProfileModel get _current => state.requireValue;

  AuthSessionRepository? _repositoryOrNull() {
    try {
      return ref.read(authSessionRepositoryProvider);
    } on UnimplementedError {
      return null;
    }
  }

  void updateEmail(String value) {
    state = AsyncData(_current.copyWith(email: value, clearErrorMessage: true));
  }

  void updatePassword(String value) {
    state = AsyncData(
      _current.copyWith(password: value, clearErrorMessage: true),
    );
  }

  void togglePasswordVisibility() {
    state = AsyncData(
      _current.copyWith(
        isPasswordVisible: !_current.isPasswordVisible,
      ),
    );
  }

  Future<void> submitLogin() async {
    final email = _current.email.trim();
    final password = _current.password.trim();

    if (email.isEmpty || password.isEmpty) {
      state = AsyncData(
        _current.copyWith(
          errorMessage: 'Please enter both email and password.',
        ),
      );
      return;
    }

    if (!email.contains('@')) {
      state = AsyncData(
        _current.copyWith(
          errorMessage: 'Please enter a valid email address.',
        ),
      );
      return;
    }

    if (password.length < 6) {
      state = AsyncData(
        _current.copyWith(
          errorMessage: 'Password must be at least 6 characters long.',
        ),
      );
      return;
    }

    final repository = _repositoryOrNull();
    if (repository != null) {
      await repository.save(
        AuthSession(
          email: email,
          token: 'mock-token-${email.hashCode}',
        ),
      );
    }

    state = AsyncData(
      _current.copyWith(
        email: email,
        isLoggedIn: true,
        isRestoringSession: false,
        errorMessage: null,
      ),
    );
  }

  Future<void> logout() async {
    final repository = _repositoryOrNull();
    if (repository != null) {
      await repository.clear();
    }

    state = AsyncData(
      _current.copyWith(
        isLoggedIn: false,
        password: '',
        isPasswordVisible: false,
        isRestoringSession: false,
        clearErrorMessage: true,
      ),
    );
  }
}
