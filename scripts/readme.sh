#!/bin/bash
set -e

REPO_URL="https://github.com/${GITHUB_REPOSITORY}"

cat > README.md <<EOF
# 📦 Downloads

✅ Auto Generated  
🕒 $(date)

EOF

for DIR in output/*; do
  ID=$(basename "$DIR")
  echo "## 📁 $ID" >> README.md

  for f in "$DIR"/*; do
    FILE=$(basename "$f")
    echo "- [$FILE]($REPO_URL/raw/main/output/$ID/$FILE)" >> README.md
  done

  echo "" >> README.md
done
