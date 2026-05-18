#!/bin/bash
set -e

SPLIT_SIZE="${SPLIT_SIZE:-2G}"

if [ ! -f output.zip ]; then
  echo "ℹ️ No zip file to split"
  exit 0
fi

split -b "$SPLIT_SIZE" output.zip output.part.
echo "✅ ZIP split done"
