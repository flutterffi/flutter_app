// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(homeViewmodel)
final homeViewmodelProvider = HomeViewmodelProvider._();

final class HomeViewmodelProvider
    extends
        $FunctionalProvider<
          List<HomeHighlightModel>,
          List<HomeHighlightModel>,
          List<HomeHighlightModel>
        >
    with $Provider<List<HomeHighlightModel>> {
  HomeViewmodelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeViewmodelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeViewmodelHash();

  @$internal
  @override
  $ProviderElement<List<HomeHighlightModel>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<HomeHighlightModel> create(Ref ref) {
    return homeViewmodel(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<HomeHighlightModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<HomeHighlightModel>>(value),
    );
  }
}

String _$homeViewmodelHash() => r'193860e30e26c223b51d30875be9df843b5fe153';

@ProviderFor(homeApiRepository)
final homeApiRepositoryProvider = HomeApiRepositoryProvider._();

final class HomeApiRepositoryProvider
    extends
        $FunctionalProvider<
          HomeApiRepository,
          HomeApiRepository,
          HomeApiRepository
        >
    with $Provider<HomeApiRepository> {
  HomeApiRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeApiRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeApiRepositoryHash();

  @$internal
  @override
  $ProviderElement<HomeApiRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  HomeApiRepository create(Ref ref) {
    return homeApiRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HomeApiRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HomeApiRepository>(value),
    );
  }
}

String _$homeApiRepositoryHash() => r'5822e39287a40a547987c92868ae1d45caec3ba3';

@ProviderFor(homeApiListViewmodel)
final homeApiListViewmodelProvider = HomeApiListViewmodelProvider._();

final class HomeApiListViewmodelProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<HomeApiItemModel>>,
          List<HomeApiItemModel>,
          FutureOr<List<HomeApiItemModel>>
        >
    with
        $FutureModifier<List<HomeApiItemModel>>,
        $FutureProvider<List<HomeApiItemModel>> {
  HomeApiListViewmodelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeApiListViewmodelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeApiListViewmodelHash();

  @$internal
  @override
  $FutureProviderElement<List<HomeApiItemModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<HomeApiItemModel>> create(Ref ref) {
    return homeApiListViewmodel(ref);
  }
}

String _$homeApiListViewmodelHash() =>
    r'0845c4a0e8578947061783aa1739a002590700d2';
