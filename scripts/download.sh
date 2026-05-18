#!/bin/bash
set -e

mkdir -p downloads

INDEX=1

echo "$URLS" | while read -r URL; do
  [ -z "$URL" ] && continue

  DIR="downloads/file_$INDEX"
  mkdir -p "$DIR"

  echo "⬇️ Downloading to $DIR"
  aria2c -x16 -s16 -k1M "$URL" -d "$DIR"

  INDEX=$((INDEX + 1))
done
