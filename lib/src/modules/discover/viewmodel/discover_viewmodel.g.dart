// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discover_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(discoverRepository)
final discoverRepositoryProvider = DiscoverRepositoryProvider._();

final class DiscoverRepositoryProvider
    extends
        $FunctionalProvider<
          DiscoverRepository,
          DiscoverRepository,
          DiscoverRepository
        >
    with $Provider<DiscoverRepository> {
  DiscoverRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'discoverRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$discoverRepositoryHash();

  @$internal
  @override
  $ProviderElement<DiscoverRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DiscoverRepository create(Ref ref) {
    return discoverRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DiscoverRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DiscoverRepository>(value),
    );
  }
}

String _$discoverRepositoryHash() =>
    r'32928b973f3e3d60bfcb889b0ed40e23c1481325';

@ProviderFor(discoverEndpointPath)
final discoverEndpointPathProvider = DiscoverEndpointPathProvider._();

final class DiscoverEndpointPathProvider
    extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  DiscoverEndpointPathProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'discoverEndpointPathProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$discoverEndpointPathHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return discoverEndpointPath(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$discoverEndpointPathHash() =>
    r'5bbf8de1dfc952f745b11abe93cc5f90d164d17a';

@ProviderFor(discoverSourceLabel)
final discoverSourceLabelProvider = DiscoverSourceLabelProvider._();

final class DiscoverSourceLabelProvider
    extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  DiscoverSourceLabelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'discoverSourceLabelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$discoverSourceLabelHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return discoverSourceLabel(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$discoverSourceLabelHash() =>
    r'f4539da2346fba14c7cea4d18784b4210c70cc55';

@ProviderFor(discoverFeaturedArticleViewmodel)
final discoverFeaturedArticleViewmodelProvider =
    DiscoverFeaturedArticleViewmodelProvider._();

final class DiscoverFeaturedArticleViewmodelProvider
    extends
        $FunctionalProvider<
          AsyncValue<DiscoverArticleModel>,
          DiscoverArticleModel,
          FutureOr<DiscoverArticleModel>
        >
    with
        $FutureModifier<DiscoverArticleModel>,
        $FutureProvider<DiscoverArticleModel> {
  DiscoverFeaturedArticleViewmodelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'discoverFeaturedArticleViewmodelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$discoverFeaturedArticleViewmodelHash();

  @$internal
  @override
  $FutureProviderElement<DiscoverArticleModel> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<DiscoverArticleModel> create(Ref ref) {
    return discoverFeaturedArticleViewmodel(ref);
  }
}

String _$discoverFeaturedArticleViewmodelHash() =>
    r'17ed53c94e703e20ed2a80897979956d03a041f5';
