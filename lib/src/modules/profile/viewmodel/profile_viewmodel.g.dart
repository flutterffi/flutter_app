// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProfileViewmodel)
final profileViewmodelProvider = ProfileViewmodelProvider._();

final class ProfileViewmodelProvider
    extends $NotifierProvider<ProfileViewmodel, ProfileModel> {
  ProfileViewmodelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileViewmodelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileViewmodelHash();

  @$internal
  @override
  ProfileViewmodel create() => ProfileViewmodel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProfileModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProfileModel>(value),
    );
  }
}

String _$profileViewmodelHash() => r'fc53352a50bba8af377031e0f9daa84a8bf468c0';

abstract class _$ProfileViewmodel extends $Notifier<ProfileModel> {
  ProfileModel build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ProfileModel, ProfileModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ProfileModel, ProfileModel>,
              ProfileModel,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
