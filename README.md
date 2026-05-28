# flutter_app

MVVM Flutter starter built with Riverpod and modular feature folders.

## Architecture

- `lib/src/app`: app bootstrap
- `lib/src/core`: routing, theme, localization
- `lib/src/shared`: shared models, repositories, views, viewmodels
- `lib/src/modules/*`: business modules with `model`, `viewmodel`, `view`, and `page`

## Features

- Five-tab bottom navigation shell
- Riverpod state management with code generation
- Chinese and English localization
- Modular MVVM folder structure

## Getting Started

```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter run
```
