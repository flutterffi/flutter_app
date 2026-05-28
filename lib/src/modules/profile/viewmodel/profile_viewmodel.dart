import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter_app/src/modules/profile/model/profile_model.dart';

part 'profile_viewmodel.g.dart';

@riverpod
ProfileModel profileViewmodel(ProfileViewmodelRef ref) {
  return const ProfileModel(
    title: 'Profile',
    subtitle: 'Account settings, preferences, and user center belong here.',
  );
}
