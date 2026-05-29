# flutter_app

Production-oriented Flutter starter built around MVVM modules, Riverpod code generation,
design-token foundations, and a reusable resource pipeline.

## What is included

- Modular MVVM structure with `model / viewmodel / view / page`
- Riverpod 3 + `riverpod_generator`
- `go_router`
- Chinese and English localization
- Shared theme, spacing, radius, responsive utilities, and shared widgets
- Branding pipeline for icons and splash assets
- Multi-density asset examples
- App config, local storage, persisted auth session, route auth guard
- Multi-environment app entrypoints

## Folder structure

- `lib/src/app`
  App shell and top-level app wiring
- `lib/src/core`
  Cross-cutting infrastructure such as config, auth, network, theme, adaptive sizing,
  localization, router, and storage
- `lib/src/shared`
  Reusable UI widgets and shared presentation helpers
- `lib/src/modules/*`
  Business modules with `model`, `viewmodel`, `view`, and `page`

## Environment entrypoints

- `lib/main.dart`
  Default dev entrypoint
- `lib/main_dev.dart`
  Development environment
- `lib/main_test.dart`
  Test/staging-style environment
- `lib/main_prod.dart`
  Production environment

Current defaults:

- `dev`: mock API enabled
- `test`: real API base URL configured, mock disabled
- `prod`: real API base URL configured, mock disabled

## Running the app

Install dependencies:

```bash
flutter pub get
```

Generate Riverpod and other build outputs:

```bash
dart run build_runner build
```

Run development:

```bash
flutter run -t lib/main_dev.dart
```

Run test environment:

```bash
flutter run -t lib/main_test.dart
```

Run production entrypoint:

```bash
flutter run -t lib/main_prod.dart
```

You can also override config values with `dart-define`:

```bash
flutter run -t lib/main_dev.dart \
  --dart-define=APP_NAME=FlutterApp \
  --dart-define=APP_ENV=dev \
  --dart-define=API_BASE_URL=https://jsonplaceholder.typicode.com \
  --dart-define=USE_MOCK_CLIENT=true
```

## Design adaptation

The design baseline is:

- `375 x 812`

Baseline config lives in:

- [lib/src/core/adaptive/app_design.dart](lib/src/core/adaptive/app_design.dart)

Context-based scaling is available through:

- `context.designWidth(value)`
- `context.designHeight(value)`
- `context.designFont(value)`
- `context.designRadius(value)`

Number-based DSL is also available:

```dart
16.w
24.h
14.sp
12.r
```

Relevant files:

- [lib/src/core/adaptive/app_scaler.dart](lib/src/core/adaptive/app_scaler.dart)
- [lib/src/core/adaptive/app_design_initializer.dart](lib/src/core/adaptive/app_design_initializer.dart)
- [lib/src/core/extensions/num_adaptive_extension.dart](lib/src/core/extensions/num_adaptive_extension.dart)

## Shared UI foundation

Shared widgets currently include:

- `AppButton`
- `AppTextField`
- `AppLoadingView`
- `AppErrorView`
- `AppEmptyView`

Files:

- [lib/src/shared/widgets](lib/src/shared/widgets)

## Config, storage, and auth

App config:

- [lib/src/core/config/model/app_config.dart](lib/src/core/config/model/app_config.dart)
- [lib/src/core/config/viewmodel/app_config_viewmodel.dart](lib/src/core/config/viewmodel/app_config_viewmodel.dart)

Storage:

- [lib/src/core/storage/service/app_storage.dart](lib/src/core/storage/service/app_storage.dart)
- [lib/src/core/storage/viewmodel/app_storage_viewmodel.dart](lib/src/core/storage/viewmodel/app_storage_viewmodel.dart)

Auth:

- [lib/src/core/auth/service/auth_repository.dart](lib/src/core/auth/service/auth_repository.dart)
- [lib/src/core/auth/service/auth_session_repository.dart](lib/src/core/auth/service/auth_session_repository.dart)
- [lib/src/core/auth/viewmodel/auth_session_controller.dart](lib/src/core/auth/viewmodel/auth_session_controller.dart)

Routing guard:

- [lib/src/core/router/app_router.dart](lib/src/core/router/app_router.dart)

## Resource pipeline

Typed assets, fonts, and colors:

```bash
dart run flutter_gen:flutter_gen_command -c pubspec.yaml
```

Branding pipeline:

```bash
./tool/generate_branding.sh
```

Asset conventions:

- [assets/README.md](assets/README.md)
- [assets/branding/README.md](assets/branding/README.md)

## Quality checks

Analyze:

```bash
flutter analyze
```

Test:

```bash
flutter test
```

## Current status

This starter is ready for direct feature development.

The next recommended step is to build real business pages on top of this base, then keep
growing the shared component layer only when repeated UI patterns appear.
