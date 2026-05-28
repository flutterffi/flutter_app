import 'package:flutter/material.dart';

import 'package:flutter_app/src/modules/profile/model/profile_model.dart';
import 'package:flutter_app/src/shared/view/module_placeholder_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({required this.model, super.key});

  final ProfileModel model;

  @override
  Widget build(BuildContext context) {
    return ModulePlaceholderView(
      title: model.title,
      subtitle: model.subtitle,
      accentColor: const Color(0xFF7C3AED),
    );
  }
}
