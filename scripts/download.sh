#!/bin/bash
set -e

if [ -z "$URLS" ]; then
  echo "❌ URLS is empty"
  exit 1
fi

mkdir -p downloads

for u in $URLS; do
  echo "⬇️ Downloading: $u"
  aria2c "$u" -d downloads
done
