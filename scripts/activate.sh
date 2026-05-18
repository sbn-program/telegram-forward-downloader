#!/bin/bash
set -e

ACT_FILE=".activated"

if [ -f "$ACT_FILE" ]; then
  echo "✅ Already activated"
  exit 0
fi

if [ -z "$ACTIVATION_CODE" ]; then
  echo "❌ ACTIVATION_CODE is missing"
  exit 1
fi

if [ "$ACTIVATION_CODE" != "$VALID_CODE" ]; then
  echo "❌ Invalid activation code"
  exit 1
fi

echo "✅ Activation successful"
echo "1" > "$ACT_FILE"
