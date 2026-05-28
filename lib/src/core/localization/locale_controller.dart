import 'dart:ui';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locale_controller.g.dart';

@riverpod
class LocaleController extends _$LocaleController {
  @override
  Locale? build() => null;

  void switchLocale(String languageCode) {
    state = Locale(languageCode);
  }
}
