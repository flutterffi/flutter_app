// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workspace_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(WorkspaceViewmodel)
final workspaceViewmodelProvider = WorkspaceViewmodelProvider._();

final class WorkspaceViewmodelProvider
    extends $NotifierProvider<WorkspaceViewmodel, WorkspaceModel> {
  WorkspaceViewmodelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'workspaceViewmodelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$workspaceViewmodelHash();

  @$internal
  @override
  WorkspaceViewmodel create() => WorkspaceViewmodel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WorkspaceModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WorkspaceModel>(value),
    );
  }
}

String _$workspaceViewmodelHash() =>
    r'31c688b2f041edfbc81eee3709cf5613e1f27a07';

abstract class _$WorkspaceViewmodel extends $Notifier<WorkspaceModel> {
  WorkspaceModel build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<WorkspaceModel, WorkspaceModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<WorkspaceModel, WorkspaceModel>,
              WorkspaceModel,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
