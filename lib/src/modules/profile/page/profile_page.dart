import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_app/src/modules/profile/view/profile_view.dart';
import 'package:flutter_app/src/modules/profile/viewmodel/profile_viewmodel.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(profileViewmodelProvider);
    return ProfileView(model: model);
  }
}
