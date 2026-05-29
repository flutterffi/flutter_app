// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(networkConfig)
final networkConfigProvider = NetworkConfigProvider._();

final class NetworkConfigProvider
    extends $FunctionalProvider<NetworkConfig, NetworkConfig, NetworkConfig>
    with $Provider<NetworkConfig> {
  NetworkConfigProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'networkConfigProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$networkConfigHash();

  @$internal
  @override
  $ProviderElement<NetworkConfig> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  NetworkConfig create(Ref ref) {
    return networkConfig(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NetworkConfig value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NetworkConfig>(value),
    );
  }
}

String _$networkConfigHash() => r'a0461b3d798621a771bb77e0456f4d2153d41591';

@ProviderFor(dio)
final dioProvider = DioProvider._();

final class DioProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  DioProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dioProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dioHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return dio(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$dioHash() => r'a7e74146510f2a0e058c7bf3c1bb429b8af8d8d3';

@ProviderFor(apiClient)
final apiClientProvider = ApiClientProvider._();

final class ApiClientProvider
    extends $FunctionalProvider<ApiClient, ApiClient, ApiClient>
    with $Provider<ApiClient> {
  ApiClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'apiClientProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$apiClientHash();

  @$internal
  @override
  $ProviderElement<ApiClient> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ApiClient create(Ref ref) {
    return apiClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ApiClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ApiClient>(value),
    );
  }
}

String _$apiClientHash() => r'f1b5aba48edba228a8c2f838052c89e964d8f929';
