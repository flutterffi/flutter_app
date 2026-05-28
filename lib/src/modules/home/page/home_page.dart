import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_app/src/core/localization/locale_controller.dart';
import 'package:flutter_app/src/modules/home/view/home_content_view.dart';
import 'package:flutter_app/src/modules/home/viewmodel/home_viewmodel.dart';
import 'package:flutter_app/src/shared/viewmodel/app_config_viewmodel.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final highlights = ref.watch(homeViewmodelProvider);
    final apiList = ref.watch(homeApiListViewmodelProvider);
    final config = ref.watch(appConfigViewmodelProvider);

    return HomeContentView(
      highlights: highlights,
      apiListAsync: apiList,
      configAsync: config,
      onSwitchLocale: (code) {
        ref.read(localeControllerProvider.notifier).switchLocale(code);
      },
      onRefreshApis: () {
        ref.invalidate(homeApiListViewmodelProvider);
      },
    );
  }
}
