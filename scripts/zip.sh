#!/bin/bash
set -e

MAX_SIZE=$((50 * 1024 * 1024))

if [ "$ZIP_MODE" != "zip" ]; then
  echo "ℹ️ ZIP disabled"
  exit 0
fi

mkdir -p output

for DIR in downloads/*; do
  [ -d "$DIR" ] || continue

  ID=$(basename "$DIR")
  OUTDIR="output/$ID"
  mkdir -p "$OUTDIR"

  echo "🗜️ Zipping $ID ..."

  # ZIP موقت برای محاسبه حجم
  if [ -n "$ZIP_PASSWORD" ]; then
    zip -P "$ZIP_PASSWORD" -r "$OUTDIR/$ID.zip" "$DIR"
  else
    zip -r "$OUTDIR/$ID.zip" "$DIR"
  fi

  SIZE=$(stat -c%s "$OUTDIR/$ID.zip")

  if [ "$SIZE" -le "$MAX_SIZE" ]; then
    echo "✅ $ID ≤ 50MB → No split"
    continue
  fi

  echo "✂️ $ID > 50MB → Split ZIP"

  rm "$OUTDIR/$ID.zip"

  if [ -n "$ZIP_PASSWORD" ]; then
    zip -P "$ZIP_PASSWORD" -r -s 50m "$OUTDIR/$ID.zip" "$DIR"
  else
    zip -r -s 50m "$OUTDIR/$ID.zip" "$DIR"
  fi

  echo "✅ Split ZIP created for $ID"
done
