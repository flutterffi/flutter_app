import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter_app/src/core/config/model/app_config.dart';
import 'package:flutter_app/src/core/config/model/app_environment.dart';

part 'app_config_viewmodel.g.dart';

@riverpod
AppConfig appConfig(Ref ref) {
  const environmentName = String.fromEnvironment(
    'APP_ENV',
    defaultValue: 'dev',
  );
  const appName = String.fromEnvironment(
    'APP_NAME',
    defaultValue: 'Flutter App',
  );
  const apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://jsonplaceholder.typicode.com',
  );
  const useMockClientValue = bool.fromEnvironment(
    'USE_MOCK_CLIENT',
    defaultValue: true,
  );

  return AppConfig(
    appName: appName,
    environment: AppEnvironment.fromName(environmentName),
    apiBaseUrl: apiBaseUrl,
    useMockClient: useMockClientValue,
  );
}
