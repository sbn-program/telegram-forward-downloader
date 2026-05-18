#!/bin/bash
set -e

if [ "$ZIP_MODE" != "zip" ]; then
  echo "ℹ️ ZIP disabled"
  exit 0
fi

echo "🗜️ Creating ZIP..."

if [ -n "$ZIP_PASSWORD" ]; then
  zip -P "$ZIP_PASSWORD" -r output.zip downloads
else
  zip -r output.zip downloads
fi

echo "✅ ZIP created"
