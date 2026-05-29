import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_app/src/modules/profile/view/profile_view.dart';
import 'package:flutter_app/src/modules/profile/viewmodel/profile_viewmodel.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(profileViewmodelProvider);

    return profileAsync.when(
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stackTrace) => Scaffold(
        body: Center(child: Text(error.toString())),
      ),
      data: (model) => ProfileView(
        model: model,
        onEmailChanged: (value) {
          ref.read(profileViewmodelProvider.notifier).updateEmail(value);
        },
        onPasswordChanged: (value) {
          ref.read(profileViewmodelProvider.notifier).updatePassword(value);
        },
        onTogglePasswordVisibility: () {
          ref
              .read(profileViewmodelProvider.notifier)
              .togglePasswordVisibility();
        },
        onSubmit: () {
          ref.read(profileViewmodelProvider.notifier).submitLogin();
        },
        onLogout: () {
          ref.read(profileViewmodelProvider.notifier).logout();
        },
      ),
    );
  }
}
