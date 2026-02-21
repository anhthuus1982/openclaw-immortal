#!/bin/bash
# restore.sh - Restore from GitHub

REPO_URL="${1:-}"
WORKSPACE="$HOME/.openclaw/workspace"

echo "🔄 RESTORE FROM GITHUB"
echo "====================="
echo ""

if [ -z "$REPO_URL" ]; then
  echo "❌ GitHub repo URL required"
  echo "Usage: ./restore.sh https://github.com/user/repo.git"
  exit 1
fi

# Backup current if exists
if [ -d "$WORKSPACE" ]; then
  echo "💾 Backing up current workspace..."
  mv "$WORKSPACE" "$WORKSPACE.backup.$(date +%s)"
fi

# Clone
echo "⬇️  Cloning from GitHub..."
git clone "$REPO_URL" "$WORKSPACE"

if [ $? -ne 0 ]; then
  echo "❌ Clone failed"
  exit 1
fi

echo "✅ Cloned!"
echo ""

# Restore dependencies
echo "🔧 Restoring dependencies..."
pip3 install chromadb colorama --user --quiet

# Start Neural Memory
echo "🐳 Starting Neural Memory..."
docker stop neural-memory 2>/dev/null || true
docker rm neural-memory 2>/dev/null || true

docker run -d \
  --name neural-memory \
  -v "$WORKSPACE/skills/neural-memory-docker/data":/root/.local/share/neural-memory \
  -p 8766:8766 \
  python:3.11-slim \
  bash -c "pip install neural-memory --quiet && export PATH=\$PATH:/root/.local/bin && nmem init && tail -f /dev/null" 2>&1 | tail -3

echo ""
echo "✅ RESTORE COMPLETE!"
echo ""
echo "🧬 Your AI companion lives again!"
echo ""
echo "Files restored: $(find "$WORKSPACE" -type f | wc -l)"
echo "Skills: $(ls "$WORKSPACE/skills/" 2>/dev/null | wc -l)"
