import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter_app/src/modules/home/model/home_highlight_model.dart';

part 'home_viewmodel.g.dart';

@riverpod
List<HomeHighlightModel> homeViewmodel(HomeViewmodelRef ref) {
  return const [
    HomeHighlightModel(
      title: 'MVVM modules',
      description: 'Each business module uses model, viewmodel, view, and page.',
    ),
    HomeHighlightModel(
      title: 'Riverpod generator',
      description: 'Providers stay typed and scalable with code generation.',
    ),
    HomeHighlightModel(
      title: 'Ready for growth',
      description: 'Tabs, routing, assets, and localization are wired already.',
    ),
  ];
}
