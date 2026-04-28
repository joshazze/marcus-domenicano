#!/bin/bash

set -e

CLAUDE_MD="$HOME/.claude/CLAUDE.md"

echo ""
echo "  Marcus Domenicano - Installer"
echo "  =============================="
echo ""
echo "  Choose your mode:"
echo ""
echo "  1) Standalone (no Obsidian - documents displayed in terminal only)"
echo "  2) Obsidian   (documents saved to your Obsidian vault automatically)"
echo ""
read -p "  Enter 1 or 2: " MODE

if [ "$MODE" != "1" ] && [ "$MODE" != "2" ]; then
  echo "  Invalid option. Exiting."
  exit 1
fi

if [ "$MODE" = "1" ]; then
  SOURCE="marcus-standalone.md"
  echo ""
  echo "  Installing standalone mode..."
else
  SOURCE="marcus-obsidian.md"
  echo ""
  read -p "  Enter your Obsidian vault path (e.g. /Users/you/Documents/MyVault): " VAULT_PATH

  if [ -z "$VAULT_PATH" ]; then
    echo "  No vault path provided. Exiting."
    exit 1
  fi

  # Remove trailing slash
  VAULT_PATH="${VAULT_PATH%/}"
  echo "  Installing Obsidian mode with vault: $VAULT_PATH"
fi

# Get the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Create ~/.claude if it doesn't exist
mkdir -p "$HOME/.claude"

# Read the agent content
AGENT_CONTENT=$(cat "$SCRIPT_DIR/$SOURCE")

# Replace vault path placeholder if Obsidian mode
if [ "$MODE" = "2" ]; then
  AGENT_CONTENT=$(echo "$AGENT_CONTENT" | sed "s|<YOUR_OBSIDIAN_VAULT_PATH>|$VAULT_PATH|g")
fi

# Check if CLAUDE.md exists and if Marcus is already installed
if [ -f "$CLAUDE_MD" ]; then
  if grep -q "Agente: Marcus Domenicano" "$CLAUDE_MD"; then
    echo ""
    echo "  Marcus Domenicano is already in your CLAUDE.md."
    read -p "  Replace existing installation? (y/n): " REPLACE
    if [ "$REPLACE" != "y" ]; then
      echo "  Aborted."
      exit 0
    fi
    # Remove existing Marcus block (between the header and the closing ELSE block)
    TEMP_FILE=$(mktemp)
    awk '
      /^# Agente: Marcus Domenicano/ { skip=1; next }
      /^} ELSE \{/ && skip { next }
      /^  \/\/ Ignorar todas as/ && skip { next }
      /^\}$/ && skip { skip=0; next }
      !skip { print }
    ' "$CLAUDE_MD" > "$TEMP_FILE"
    mv "$TEMP_FILE" "$CLAUDE_MD"
  fi
  # Prepend agent to existing CLAUDE.md
  TEMP_FILE=$(mktemp)
  echo "$AGENT_CONTENT" > "$TEMP_FILE"
  echo "" >> "$TEMP_FILE"
  echo "---" >> "$TEMP_FILE"
  echo "" >> "$TEMP_FILE"
  cat "$CLAUDE_MD" >> "$TEMP_FILE"
  mv "$TEMP_FILE" "$CLAUDE_MD"
else
  echo "$AGENT_CONTENT" > "$CLAUDE_MD"
fi

# Install slash commands to ~/.claude/commands/
COMMANDS_DIR="$HOME/.claude/commands"
mkdir -p "$COMMANDS_DIR"

if [ -d "$SCRIPT_DIR/commands" ]; then
  for cmd in "$SCRIPT_DIR/commands/"*.md; do
    [ -f "$cmd" ] && cp "$cmd" "$COMMANDS_DIR/"
  done
  echo "  Slash commands installed: /marcus, /marcus-review, /marcus-batch"
fi

echo ""
echo "  Done! Marcus Domenicano is now installed."
echo ""
echo "  Usage: mention 'marcus' in any Claude Code prompt,"
echo "         or use /marcus, /marcus-review, /marcus-batch."
echo "  Example: marcus, process this PDF: /path/to/file.pdf"
echo ""
