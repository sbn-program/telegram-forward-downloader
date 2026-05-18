#!/bin/bash
set -e

REPO_URL="https://github.com/${GITHUB_REPOSITORY}"

cat > README.md <<EOF
# 📦 Downloads

✅ Auto Generated  
🕒 $(date)

EOF

for DIR in downloads/*; do
  NAME=$(basename "$DIR")
  echo "## 📁 $NAME" >> README.md

  for f in "$DIR"/*; do
    FILE=$(basename "$f")
    echo "- [$FILE]($REPO_URL/raw/main/downloads/$NAME/$FILE)" >> README.md
  done

  echo "" >> README.md
done
