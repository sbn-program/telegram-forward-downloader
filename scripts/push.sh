#!/bin/bash
set -e

BRANCH="${PUSH_BRANCH:-downloads}"
OUTDIR="output"

git config user.name "github-actions"
git config user.email "actions@github.com"

mkdir -p "$OUTDIR"

cp -r downloads "$OUTDIR/" 2>/dev/null || true
cp output.zip "$OUTDIR/" 2>/dev/null || true
cp output.part.* "$OUTDIR/" 2>/dev/null || true

git checkout -B "$BRANCH"

git add "$OUTDIR"

if git diff --cached --quiet; then
  echo "ℹ️ Nothing to commit"
  exit 0
fi

git commit -m "⬆️ Incremental upload - $(date '+%Y-%m-%d %H:%M:%S')"
git push origin "$BRANCH"
