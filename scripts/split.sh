#!/bin/bash
set -e

SPLIT_SIZE="50M"

if [ ! -f output.zip ]; then
  echo "❌ output.zip not found"
  exit 1
fi

echo "✂️ Splitting ZIP into 50MB parts..."
split -b "$SPLIT_SIZE" output.zip output.part.

rm output.zip
echo "✅ Split completed"
