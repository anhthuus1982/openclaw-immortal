#!/bin/bash
# setup.sh - Setup OpenClaw Immortal

set -e

echo "🔧 SETUP: OpenClaw Immortal"
echo "============================"
echo ""

WORKSPACE="$HOME/.openclaw/workspace"

# Create directories
echo "📁 Creating directories..."
mkdir -p "$WORKSPACE"/{skills,memory,tasks,projects,logs}

# Install dependencies
echo "📦 Installing dependencies..."
pip3 install chromadb colorama --user --quiet

# Setup Kronos
echo "🧠 Setting up Kronos Memory..."
cd "$WORKSPACE/skills/kronos-memory" 2>/dev/null || true
python3 scripts/kronos-init.py 2>/dev/null || echo "   Kronos init skipped (may already exist)"

# Setup Neural
echo "🐳 Setting up Neural Memory..."
docker stop neural-memory 2>/dev/null || true
docker rm neural-memory 2>/dev/null || true

docker run -d \
  --name neural-memory \
  -v "$WORKSPACE/skills/neural-memory-docker/data":/root/.local/share/neural-memory \
  -p 8766:8766 \
  python:3.11-slim \
  bash -c "pip install neural-memory --quiet && export PATH=\$PATH:/root/.local/bin && nmem init && tail -f /dev/null" 2>&1 | tail -3

echo ""
echo "✅ Setup complete!"
