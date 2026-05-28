import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter_app/src/modules/notifications/model/notifications_model.dart';

part 'notifications_viewmodel.g.dart';

@riverpod
NotificationsModel notificationsViewmodel(Ref ref) {
  return const NotificationsModel(
    title: 'Notifications',
    subtitle: 'Alert center, inbox, and message actions can live in this module.',
  );
}
