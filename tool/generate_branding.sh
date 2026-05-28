#!/bin/zsh
set -euo pipefail

cd "$(dirname "$0")/.."

echo "Generating FlutterGen assets..."
dart run flutter_gen:flutter_gen_command -c pubspec.yaml

echo "Generating launcher icons..."
dart run flutter_launcher_icons

echo "Generating native splash..."
dart run flutter_native_splash:create

echo "Branding pipeline completed."
