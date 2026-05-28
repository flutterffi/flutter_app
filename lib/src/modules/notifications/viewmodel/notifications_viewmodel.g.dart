// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(notificationsViewmodel)
final notificationsViewmodelProvider = NotificationsViewmodelProvider._();

final class NotificationsViewmodelProvider
    extends
        $FunctionalProvider<
          NotificationsModel,
          NotificationsModel,
          NotificationsModel
        >
    with $Provider<NotificationsModel> {
  NotificationsViewmodelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'notificationsViewmodelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$notificationsViewmodelHash();

  @$internal
  @override
  $ProviderElement<NotificationsModel> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  NotificationsModel create(Ref ref) {
    return notificationsViewmodel(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NotificationsModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NotificationsModel>(value),
    );
  }
}

String _$notificationsViewmodelHash() =>
    r'97b81ff91e5a99e14fcff915b6af60902485bb01';
