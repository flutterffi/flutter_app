class AppConfigModel {
  const AppConfigModel({
    required this.appName,
    required this.environment,
    required this.enabledModules,
  });

  factory AppConfigModel.fromJson(Map<String, dynamic> json) {
    return AppConfigModel(
      appName: json['appName'] as String? ?? '',
      environment: json['environment'] as String? ?? '',
      enabledModules: (json['enabledModules'] as List<dynamic>? ?? const [])
          .map((item) => item as String)
          .toList(),
    );
  }

  final String appName;
  final String environment;
  final List<String> enabledModules;

  Map<String, dynamic> toJson() {
    return {
      'appName': appName,
      'environment': environment,
      'enabledModules': enabledModules,
    };
  }
}
