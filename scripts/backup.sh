#!/bin/bash
# backup.sh - Manual backup to GitHub

WORKSPACE="$HOME/.openclaw/workspace"
CONFIG_FILE="$HOME/.openclaw/.immortal-config"
LOG_FILE="$HOME/.openclaw/logs/backup.log"

echo "💾 BACKUP TO GITHUB"
echo "=================="
echo ""

# Load config
if [ -f "$CONFIG_FILE" ]; then
  source "$CONFIG_FILE"
fi

if [ -z "$REPO_URL" ]; then
  echo "❌ GitHub repo not configured"
  echo "Run: ./config.sh --repo YOUR_REPO_URL"
  exit 1
fi

cd "$WORKSPACE"

# Configure git
git config user.email "openclaw@local" 2>/dev/null || true
git config user.name "OpenClaw Immortal" 2>/dev/null || true

# Check for changes
if git diff --quiet && git diff --cached --quiet; then
  echo "ℹ️  No changes to backup"
  exit 0
fi

# Save Neural Memory
docker cp neural-memory:/root/.local/share/neural-memory \
  skills/neural-memory-docker/data/ 2>/dev/null || true

# Commit and push
git add -A
git commit -m "🔄 Backup: $(date '+%Y-%m-%d %H:%M')" >/dev/null

# Push with token if available
if [ -n "$GITHUB_TOKEN" ]; then
  REPO_WITH_TOKEN="${REPO_URL/https:\/\//https:\/\/anhthuus1982:${GITHUB_TOKEN}@}"
  git remote set-url origin "$REPO_WITH_TOKEN"
fi

if git push origin main 2>&1 | grep -q "main"; then
  echo "✅ Backup successful!"
  echo "   Time: $(date '+%H:%M')"
  echo "   Repo: $REPO_URL"
  
  # Clean token
  git remote set-url origin "$REPO_URL"
else
  echo "❌ Backup failed"
fi
