#!/bin/bash
set -euo pipefail

BUILD_DIR="build"
SRC_DIR="src"
mkdir -p "$BUILD_DIR"

echo "==> Compiling Zig files to shared libraries..."

for asmfile in "$SRC_DIR"/*.s; do
  [ -f "$asmfile" ] || continue
  name=$(basename "$asmfile" .zig)
  echo "    compiling $asmfile -> $BUILD_DIR/$name.so"
  as "$name" -o $asmfile.o
done

echo "==> Done. Libraries in $BUILD_DIR/"
ls -la "$BUILD_DIR"/
