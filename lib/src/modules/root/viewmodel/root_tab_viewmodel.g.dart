// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'root_tab_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RootTabViewmodel)
final rootTabViewmodelProvider = RootTabViewmodelProvider._();

final class RootTabViewmodelProvider
    extends $NotifierProvider<RootTabViewmodel, int> {
  RootTabViewmodelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'rootTabViewmodelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$rootTabViewmodelHash();

  @$internal
  @override
  RootTabViewmodel create() => RootTabViewmodel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$rootTabViewmodelHash() => r'762b5018d66c896e7df86d79b9b1fe49fbc83d96';

abstract class _$RootTabViewmodel extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
