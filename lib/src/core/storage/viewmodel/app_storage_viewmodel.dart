import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_app/src/core/storage/service/app_storage.dart';

part 'app_storage_viewmodel.g.dart';

@riverpod
SharedPreferences sharedPreferences(Ref ref) {
  throw UnimplementedError(
    'sharedPreferencesProvider must be overridden at app startup.',
  );
}

@riverpod
AppStorage appStorage(Ref ref) {
  final preferences = ref.watch(sharedPreferencesProvider);
  return AppStorage(preferences);
}
