#!/bin/bash
set -e

OUTDIR="output"

git config user.name "github-actions"
git config user.email "actions@github.com"

mkdir -p "$OUTDIR"

cp output.zip "$OUTDIR/" 2>/dev/null || true
cp output.z* "$OUTDIR/" 2>/dev/null || true
cp -r downloads "$OUTDIR/" 2>/dev/null || true

git add "$OUTDIR"

if git diff --cached --quiet; then
  echo "ℹ️ Nothing to push"
  exit 0
fi

git commit -m "⬆️ Auto upload $(date '+%Y-%m-%d %H:%M:%S')"
git push origin main
