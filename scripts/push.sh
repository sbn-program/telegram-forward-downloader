#!/bin/bash
set -e

git config user.name "github-actions"
git config user.email "actions@github.com"

git add output

if git diff --cached --quiet; then
  echo "ℹ️ Nothing to push"
  exit 0
fi

git commit -m "⬆️ Auto upload $(date '+%Y-%m-%d %H:%M:%S')"
git push origin main
