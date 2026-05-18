#!/bin/bash
set -e

BRANCH="downloads"
REPO_URL="https://github.com/${GITHUB_REPOSITORY}"

cat > README.md <<EOF
# 📦 Download Center

✅ Auto Generated  
🕒 $(date)

## 🔗 Download Parts
EOF

for f in output/output.part.*; do
  FILE=$(basename "$f")
  echo "- [$FILE]($REPO_URL/raw/$BRANCH/output/$FILE)" >> README.md
done

git add README.md
git commit -m "📝 Update README"
git push origin "$BRANCH"
