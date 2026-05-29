import 'package:flutter_app/bootstrap.dart';
import 'package:flutter_app/src/core/config/model/app_config.dart';
import 'package:flutter_app/src/core/config/model/app_environment.dart';

Future<void> main() {
  return bootstrap(
    const AppConfig(
      appName: 'Flutter App Dev',
      environment: AppEnvironment.dev,
      apiBaseUrl: 'https://jsonplaceholder.typicode.com',
      useMockClient: true,
    ),
  );
}
