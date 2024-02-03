#!/bash/bash
# Run this within Git Bash

clear

cd "$(dirname "$0")/.."

if [ -d "build" ]; then
  rm -rf build
fi

flutter pub cache clean -f
flutter clean
flutter pub get
flutter build windows --release