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
    extends $AsyncNotifierProvider<ProfileViewmodel, ProfileModel> {
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
}

String _$profileViewmodelHash() => r'7c9bb5a1ecb0e4bc8ad0e7486d2d7b25c50d5a63';

abstract class _$ProfileViewmodel extends $AsyncNotifier<ProfileModel> {
  FutureOr<ProfileModel> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<ProfileModel>, ProfileModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ProfileModel>, ProfileModel>,
              AsyncValue<ProfileModel>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
