#!/bin/bash
set -e

BRANCH="${PUSH_BRANCH:-downloads}"
DIR="output"

git config user.name "github-actions"
git config user.email "actions@github.com"

mkdir -p "$DIR"

mv output.zip "$DIR/" 2>/dev/null || true
mv output.part.* "$DIR/" 2>/dev/null || true
mv downloads "$DIR/" 2>/dev/null || true

git checkout -B "$BRANCH"

git add "$DIR"

if git diff --cached --quiet; then
  echo "ℹ️ Nothing to push"
  exit 0
fi

git commit -m "⬆️ Incremental upload - $(date '+%Y-%m-%d %H:%M:%S')"
git push origin "$BRANCH" --force
