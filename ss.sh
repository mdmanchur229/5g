#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

# 🔧 আপনার তথ্য
GITHUB_USERNAME="mdmanchur229"
GITHUB_REPO="5g"

# 🔑 টোকেন ইনপুট
read -sp "আপনার GitHub Personal Access Token দিন: " GITHUB_TOKEN
echo ""

REPO_URL="https://$GITHUB_USERNAME:$GITHUB_TOKEN@github.com/$GITHUB_USERNAME/$GITHUB_REPO.git"
PROJECT_DIR="$PWD"

# ✅ Git কনফিগ
git config --global user.name "$GITHUB_USERNAME"
git config --global user.email "$GITHUB_USERNAME@users.noreply.github.com"

# ✅ .gitignore ফাইলটি খালি করে দেওয়া হলো যাতে কিছুই বাদ না পড়ে
# আপনি যদি চান নির্দিষ্ট কিছু ফাইল (যেমন .env) বাদ থাকুক, তবে সেগুলো এখানে রাখতে পারেন।
cat <<EOF > .gitignore
# কোনো ফাইল ইগনোর করা হবে না
EOF

# ✅ Git ইনিশিয়ালাইজেশন
if [ -d .git ]; then
  rm -rf .git
fi
git init

# ✅ ফাইল অ্যাড এবং পুশ
git remote add origin "$REPO_URL"
git add .
git commit -m "🚀 সব ফাইলসহ আপলোড: $(date '+%Y-%m-%d %H:%M:%S')"
git branch -M main
git push -u origin main --force

echo "✅ জিপ ফাইলসহ সবকিছু সফলভাবে আপলোড হয়েছে!"
