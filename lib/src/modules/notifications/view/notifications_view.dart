import 'package:flutter/material.dart';

import 'package:flutter_app/src/modules/notifications/model/notifications_model.dart';
import 'package:flutter_app/src/shared/view/module_placeholder_view.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({required this.model, super.key});

  final NotificationsModel model;

  @override
  Widget build(BuildContext context) {
    return ModulePlaceholderView(
      title: model.title,
      subtitle: model.subtitle,
      accentColor: const Color(0xFFDC2626),
    );
  }
}
