# Assets Guide

This project uses Flutter's resolution-aware asset convention for business images.

## Resolution-aware images

Use the base file as the `1.0x` image, then place higher-density variants in sibling
folders named `2.0x`, `3.0x`, and so on.

Example:

```text
assets/images/illustrations/home_hero.png
assets/images/illustrations/2.0x/home_hero.png
assets/images/illustrations/3.0x/home_hero.png
```

Another example:

```text
assets/branding/app_icon.png
assets/branding/2.0x/app_icon.png
assets/branding/3.0x/app_icon.png
```

In Dart code, always reference the base asset only:

```dart
Assets.images.illustrations.homeHero.image()
Assets.branding.appIcon.image()
```

Flutter will choose the correct variant automatically based on device pixel ratio.

## Recommended rules

- UI images should provide at least a base image plus `2.0x` and `3.0x` variants.
- Keep the same file name across all density folders.
- Put shared brand assets in `assets/branding/`.
- Put page or module images in `assets/images/...`.
- Fonts live in `assets/fonts/`.
- Color tokens live in `assets/colors/`.

## Current examples in this repo

- `assets/images/illustrations/home_hero.png`
- `assets/images/illustrations/2.0x/home_hero.png`
- `assets/images/illustrations/3.0x/home_hero.png`
- `assets/branding/app_icon.png`
- `assets/branding/2.0x/app_icon.png`
- `assets/branding/3.0x/app_icon.png`
