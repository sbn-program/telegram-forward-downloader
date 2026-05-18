#!/bin/bash
set -e

if [ "$ZIP_MODE" = "zip" ]; then
  if [ -n "$ZIP_PASSWORD" ]; then
    zip -P "$ZIP_PASSWORD" -r output.zip downloads
  else
    zip -r output.zip downloads
  fi
elif [ "$ZIP_MODE" = "split" ]; then
  zip -r output.zip downloads
else
  exit 0
fi

echo "✅ ZIP created"
