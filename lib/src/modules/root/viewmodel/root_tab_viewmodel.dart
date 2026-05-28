import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'root_tab_viewmodel.g.dart';

@riverpod
class RootTabViewmodel extends _$RootTabViewmodel {
  @override
  int build() => 0;

  void selectTab(int index) {
    state = index;
  }
}
