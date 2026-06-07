#!/bin/bash
set -euo pipefail

BUILD_DIR="build"
SRC_DIR="src"
mkdir -p "$BUILD_DIR"

echo "==> Compiling Zig files to shared libraries..."

for zigfile in "$SRC_DIR"/*.zig; do
    [ -f "$zigfile" ] || continue
    name=$(basename "$zigfile" .zig)
    echo "    compiling $zigfile -> $BUILD_DIR/$name.so"
    zig build-lib "$zigfile" \
        -dynamic \
        -fPIC \
        -O ReleaseFast \
        -femit-bin="$BUILD_DIR/$name.so" \
        2>&1
done

echo "==> Done. Libraries in $BUILD_DIR/"
ls -la "$BUILD_DIR"/
