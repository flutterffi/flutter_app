enum AppEnvironment {
  dev,
  test,
  prod;

  static AppEnvironment fromName(String value) {
    return switch (value.toLowerCase()) {
      'prod' || 'production' => AppEnvironment.prod,
      'test' || 'staging' => AppEnvironment.test,
      _ => AppEnvironment.dev,
    };
  }
}
