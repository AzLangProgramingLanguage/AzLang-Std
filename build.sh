#!/bin/bash
set -euo pipefail

BUILD_DIR="build"
SRC_DIR="src"
mkdir -p "$BUILD_DIR"

echo "==> Compiling Zig files to shared libraries..."

for asmfile in "$SRC_DIR"/*.s; do
  [ -f "$asmfile" ] || continue
  name=$(basename "$asmfile" .s)
  echo "    compiling $asmfile -> $BUILD_DIR/$name.o"
  as "$asmfile" -o $BUILD_DIR/$name.o
done

echo "==> Done. Libraries in $BUILD_DIR/"
ls -la "$BUILD_DIR"/
