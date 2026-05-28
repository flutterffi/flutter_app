import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter_app/src/modules/profile/model/profile_model.dart';

part 'profile_viewmodel.g.dart';

@riverpod
class ProfileViewmodel extends _$ProfileViewmodel {
  @override
  ProfileModel build() {
    return const ProfileModel(
      title: 'Login',
      subtitle: 'Sign in to sync settings, workspace progress, and team context.',
      email: '',
      password: '',
      isPasswordVisible: false,
      isLoggedIn: false,
      errorMessage: null,
    );
  }

  void updateEmail(String value) {
    state = state.copyWith(email: value, clearErrorMessage: true);
  }

  void updatePassword(String value) {
    state = state.copyWith(password: value, clearErrorMessage: true);
  }

  void togglePasswordVisibility() {
    state = state.copyWith(isPasswordVisible: !state.isPasswordVisible);
  }

  void submitLogin() {
    final email = state.email.trim();
    final password = state.password.trim();

    if (email.isEmpty || password.isEmpty) {
      state = state.copyWith(errorMessage: 'Please enter both email and password.');
      return;
    }

    if (!email.contains('@')) {
      state = state.copyWith(errorMessage: 'Please enter a valid email address.');
      return;
    }

    if (password.length < 6) {
      state = state.copyWith(
        errorMessage: 'Password must be at least 6 characters long.',
      );
      return;
    }

    state = state.copyWith(
      isLoggedIn: true,
      errorMessage: null,
    );
  }

  void logout() {
    state = state.copyWith(
      isLoggedIn: false,
      password: '',
      isPasswordVisible: false,
      clearErrorMessage: true,
    );
  }
}
