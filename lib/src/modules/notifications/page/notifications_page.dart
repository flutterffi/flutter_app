import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_app/src/modules/notifications/view/notifications_view.dart';
import 'package:flutter_app/src/modules/notifications/viewmodel/notifications_viewmodel.dart';

class NotificationsPage extends ConsumerWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(notificationsViewmodelProvider);
    return NotificationsView(model: model);
  }
}
