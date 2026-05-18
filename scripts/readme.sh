#!/bin/bash
set -e

REPO_URL="https://github.com/${GITHUB_REPOSITORY}"

cat > README.md <<EOF
# 📦 Download Files

✅ Auto Generated  
🕒 $(date)

## 🔗 Download Parts (WinRAR Compatible)

EOF

for f in output/output.zip output/output.z*; do
  FILE=$(basename "$f")
  echo "- [$FILE]($REPO_URL/raw/main/output/$FILE)" >> README.md
done

git add README.md
git commit -m "📝 Update README"
git push origin main
