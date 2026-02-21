#!/bin/bash
# config.sh - Configure GitHub settings

CONFIG_FILE="$HOME/.openclaw/.immortal-config"

usage() {
  echo "Usage: ./config.sh [options]"
  echo ""
  echo "Options:"
  echo "  --repo URL       Set GitHub repository URL"
  echo "  --token TOKEN    Set GitHub personal access token"
  echo "  --show           Show current config"
  echo ""
  echo "Example:"
  echo "  ./config.sh --repo https://github.com/user/repo.git"
  echo "  ./config.sh --token ghp_xxxxxxxx"
}

# Load existing config
[ -f "$CONFIG_FILE" ] && source "$CONFIG_FILE"

case "${1:-}" in
  --repo)
    REPO="$2"
    echo "REPO_URL=$REPO" > "$CONFIG_FILE"
    echo "✅ Repository set: $REPO"
    ;;
  --token)
    TOKEN="$2"
    echo "GITHUB_TOKEN=$TOKEN" >> "$CONFIG_FILE"
    chmod 600 "$CONFIG_FILE"
    echo "✅ Token saved (secure)"
    ;;
  --show)
    [ -f "$CONFIG_FILE" ] && cat "$CONFIG_FILE" | grep -v TOKEN || echo "No config"
    ;;
  *)
    usage
    ;;
esac
