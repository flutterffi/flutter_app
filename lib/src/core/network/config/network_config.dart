class NetworkConfig {
  const NetworkConfig({
    required this.baseUrl,
    required this.useMockClient,
  });

  final String baseUrl;
  final bool useMockClient;
}
