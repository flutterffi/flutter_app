import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_app/src/app/app.dart';
import 'package:flutter_app/src/core/config/model/app_config.dart';
import 'package:flutter_app/src/core/config/viewmodel/app_config_viewmodel.dart';
import 'package:flutter_app/src/core/storage/viewmodel/app_storage_viewmodel.dart';

Future<void> bootstrap(AppConfig appConfig) async {
  WidgetsFlutterBinding.ensureInitialized();
  final preferences = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        appConfigProvider.overrideWithValue(appConfig),
        sharedPreferencesProvider.overrideWithValue(preferences),
      ],
      child: const FlutterApp(),
    ),
  );
}
