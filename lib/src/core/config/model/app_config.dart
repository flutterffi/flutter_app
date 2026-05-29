import 'package:flutter_app/src/core/config/model/app_environment.dart';

class AppConfig {
  const AppConfig({
    required this.appName,
    required this.environment,
    required this.apiBaseUrl,
    required this.useMockClient,
  });

  final String appName;
  final AppEnvironment environment;
  final String apiBaseUrl;
  final bool useMockClient;
}
