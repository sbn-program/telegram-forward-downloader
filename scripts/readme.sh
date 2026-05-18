#!/bin/bash
set -e

git config user.name "github-actions"
git config user.email "actions@github.com"

REPO_URL="https://github.com/${GITHUB_REPOSITORY}"

for DIR in output/*; do
  [ -d "$DIR" ] || continue

  ID=$(basename "$DIR")
  README="$DIR/README.md"

  cat > "$README" <<EOF
# 📦 Download Package

✅ Auto Generated  
🆔 ID: $ID  
🕒 $(date)

## 🔗 Files
EOF

  for f in "$DIR"/*; do
    FILE=$(basename "$f")
    [ "$FILE" = "README.md" ] && continue
    echo "- [$FILE]($REPO_URL/raw/main/output/$ID/$FILE)" >> "$README"
  done
done

git add output

if git diff --cached --quiet; then
  echo "ℹ️ No README changes"
  exit 0
fi

git commit -m "📝 Update package README(s)"
git push origin main

  echo "" >> README.md
done

git add README.md

if git diff --cached --quiet; then
  echo "ℹ️ README unchanged"
  exit 0
fi

git commit -m "📝 Update README"
git push origin main

done
