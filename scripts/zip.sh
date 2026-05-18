#!/bin/bash
set -e

if [ "$ZIP_MODE" != "zip" ]; then
  echo "ℹ️ ZIP disabled"
  exit 0
fi

echo "🗜️ Creating WinRAR-compatible split ZIP (50MB)..."

if [ -n "$ZIP_PASSWORD" ]; then
  zip -P "$ZIP_PASSWORD" -r -s 50m output.zip downloads
else
  zip -r -s 50m output.zip downloads
fi

echo "✅ ZIP + SPLIT done"
