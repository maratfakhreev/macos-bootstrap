#!/bin/bash
set -e

BACKUP_DIR=~/dev-backups

# Create base folder
mkdir -p "$BACKUP_DIR"

echo "🔄 Backing up Cursor settings..."
mkdir -p "$BACKUP_DIR/cursor"
cp -r ~/Library/Application\ Support/Cursor/User/* "$BACKUP_DIR/cursor/" || echo "⚠️ No Cursor settings found"

echo "🔄 Backing up SSH folder..."
mkdir -p "$BACKUP_DIR/ssh"
cp -r ~/.ssh/* "$BACKUP_DIR/ssh/" || echo "⚠️ No SSH folder found"

echo "🔄 Backing up .zshrc..."
mkdir -p "$BACKUP_DIR/zsh"
cp ~/.zshrc "$BACKUP_DIR/zsh/.zshrc" || echo "⚠️ No .zshrc found"

echo "✅ Backup complete! Files saved to $BACKUP_DIR"
