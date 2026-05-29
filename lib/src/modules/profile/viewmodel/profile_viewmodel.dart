import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter_app/src/core/auth/model/auth_session.dart';
import 'package:flutter_app/src/core/auth/viewmodel/auth_session_controller.dart';
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

    ref.listen<AsyncValue<AuthSession?>>(
      authSessionControllerProvider,
      (previous, next) {
        final current = state.asData?.value;
        if (current == null) {
          return;
        }

        final session = next.asData?.value;

        state = AsyncData(
          current.copyWith(
            email: session?.email ?? current.email,
            isLoggedIn: session != null,
            isRestoringSession: next.isLoading,
            clearErrorMessage: next.hasValue,
          ),
        );
      },
    );

    final session = await ref.watch(authSessionControllerProvider.future);

    return baseState.copyWith(
      email: session?.email ?? '',
      isLoggedIn: session != null,
      isRestoringSession: false,
    );
  }

  ProfileModel get _current => state.requireValue;

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

    await ref
        .read(authSessionControllerProvider.notifier)
        .login(email: email, password: password);
  }

  Future<void> logout() async {
    await ref.read(authSessionControllerProvider.notifier).logout();
    state = AsyncData(
      _current.copyWith(
        password: '',
        isPasswordVisible: false,
        clearErrorMessage: true,
      ),
    );
  }
}
