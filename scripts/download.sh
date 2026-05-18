#!/bin/bash
set -e

mkdir -p downloads

echo "$URLS" | while read -r URL; do
  [ -z "$URL" ] && continue

  ID=$(openssl rand -hex 5)
  DIR="downloads/$ID"
  mkdir -p "$DIR"

  echo "⬇️ Downloading to $DIR"
  aria2c -x16 -s16 -k1M "$URL" -d "$DIR"
done
