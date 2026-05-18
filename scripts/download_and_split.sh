#!/bin/bash
set -e

mkdir -p downloads
cd downloads

telegram-dl \
  --api-id "$TG_API_ID" \
  --api-hash "$TG_API_HASH" \
  "$POST_URL"

FILE=$(ls | head -n 1)

mkdir parts
split -b 50M "$FILE" "parts/${FILE}.part_"

rm "$FILE"
