#!/bin/bash
# install.sh - One-line installer for OpenClaw Immortal

set -e

REPO_URL="https://github.com/anhthuus1982/openclaw-immortal"
INSTALL_DIR="$HOME/.openclaw/workspace/skills/openclaw-immortal"

echo "🧬 OPENCLAW IMMORTAL - INSTALLER"
echo "================================"
echo ""

# Check dependencies
echo "📋 Checking dependencies..."
command -v git >/dev/null 2>&1 || { echo "❌ Git required"; exit 1; }
command -v python3 >/dev/null 2>&1 || { echo "❌ Python3 required"; exit 1; }
echo "✅ Dependencies OK"

# Clone repo
echo ""
echo "⬇️  Cloning OpenClaw Immortal..."
if [ -d "$INSTALL_DIR" ]; then
  echo "   Directory exists, updating..."
  cd "$INSTALL_DIR" && git pull
else
  git clone "$REPO_URL.git" "$INSTALL_DIR"
fi

# Run setup
echo ""
echo "🔧 Running setup..."
cd "$INSTALL_DIR"
./scripts/setup.sh

echo ""
echo "✅ INSTALLATION COMPLETE!"
echo ""
echo "🧬 Your AI companion is now immortal!"
echo ""
echo "Next steps:"
echo "  1. Configure GitHub: ./scripts/config.sh --repo YOUR_REPO"
echo "  2. Add token: ./scripts/config.sh --token YOUR_TOKEN"
echo "  3. Test backup: ./scripts/backup.sh"
echo ""
echo "📖 Read SKILL.md for full documentation"
