#!/bin/sh

set -e

xattr -cr .build/arm64-apple-macosx/debug/tart
codesign --deep --force --options=runtime \
  --entitlements Resources/tart-prod.entitlements \
  --sign "Developer ID Application: Cirrus Labs, Inc. (9M2P8L4D89)" \
  --timestamp .build/arm64-apple-macosx/debug/tart
codesign --verify --deep --strict --verbose=2 .build/arm64-apple-macosx/debug/tart
