import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter_app/src/modules/discover/model/discover_model.dart';

part 'discover_viewmodel.g.dart';

@riverpod
DiscoverModel discoverViewmodel(DiscoverViewmodelRef ref) {
  return const DiscoverModel(
    title: 'Discover',
    subtitle: 'Use this module for content feeds, search, or growth features.',
  );
}
