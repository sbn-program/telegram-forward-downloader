#!/bin/bash
set -e

BRANCH="${PUSH_BRANCH:-downloads}"
OUTDIR="output"

echo "📂 Current dir:"
pwd
ls -lah

git config user.name "github-actions"
git config user.email "actions@github.com"

mkdir -p "$OUTDIR"

echo "📦 Copying files..."
[ -d downloads ] && cp -r downloads "$OUTDIR/"
[ -f output.zip ] && cp output.zip "$OUTDIR/"
ls output.part.* 2>/dev/null && cp output.part.* "$OUTDIR/" || true

echo "🌿 Switching branch..."
git checkout -B "$BRANCH"

echo "📁 Files in output/:"
ls -lah "$OUTDIR"

git add "$OUTDIR"

if git diff --cached --quiet; then
  echo "⚠️ Nothing staged – aborting push"
  exit 0
fi

git commit -m "⬆️ Auto upload $(date '+%Y-%m-%d %H:%M:%S')"
git push origin "$BRANCH"
