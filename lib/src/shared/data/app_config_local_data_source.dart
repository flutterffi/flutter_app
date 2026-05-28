import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:flutter_app/src/shared/model/app_config_model.dart';

class AppConfigLocalDataSource {
  const AppConfigLocalDataSource();

  Future<AppConfigModel> load() async {
    final rawJson = await rootBundle.loadString('assets/config/app_config.json');
    final json = jsonDecode(rawJson) as Map<String, dynamic>;
    return AppConfigModel.fromJson(json);
  }
}
