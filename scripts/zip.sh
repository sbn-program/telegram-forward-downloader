#!/bin/bash
set -e

MAX_SIZE=$((50 * 1024 * 1024)) # 50MB

if [ "$ZIP_MODE" != "zip" ]; then
  echo "ℹ️ ZIP disabled"
  exit 0
fi

for DIR in downloads/*; do
  [ -d "$DIR" ] || continue

  NAME=$(basename "$DIR")
  OUTDIR="output/$NAME"
  mkdir -p "$OUTDIR"

  echo "🗜️ Zipping $NAME ..."

  # ZIP موقت برای محاسبه حجم
  if [ -n "$ZIP_PASSWORD" ]; then
    zip -P "$ZIP_PASSWORD" -r "$OUTDIR/$NAME.zip" "$DIR"
  else
    zip -r "$OUTDIR/$NAME.zip" "$DIR"
  fi

  SIZE=$(stat -c%s "$OUTDIR/$NAME.zip")

  if [ "$SIZE" -le "$MAX_SIZE" ]; then
    echo "✅ Size ≤ 50MB → No split needed"
    continue
  fi

  echo "✂️ Size > 50MB → Creating WinRAR split ZIP"

  rm "$OUTDIR/$NAME.zip"

  if [ -n "$ZIP_PASSWORD" ]; then
    zip -P "$ZIP_PASSWORD" -r -s 50m "$OUTDIR/$NAME.zip" "$DIR"
  else
    zip -r -s 50m "$OUTDIR/$NAME.zip" "$DIR"
  fi

  echo "✅ Split ZIP created for $NAME"
