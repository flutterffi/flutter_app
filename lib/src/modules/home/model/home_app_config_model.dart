class HomeAppConfigModel {
  const HomeAppConfigModel({
    required this.appName,
    required this.environment,
    required this.enabledModules,
  });

  factory HomeAppConfigModel.fromJson(Map<String, dynamic> json) {
    return HomeAppConfigModel(
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
}
