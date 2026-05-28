import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_app/src/modules/discover/view/discover_view.dart';
import 'package:flutter_app/src/modules/discover/viewmodel/discover_viewmodel.dart';

class DiscoverPage extends ConsumerWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(discoverViewmodelProvider);
    return DiscoverView(model: model);
  }
}
