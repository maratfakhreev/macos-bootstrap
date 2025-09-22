#!/bin/bash
set -e

BACKUP_DIR=~/dev-backups

echo "♻️ Restoring Cursor settings..."
cp -r "$BACKUP_DIR/cursor/"* ~/Library/Application\ Support/Cursor/User/ || echo "⚠️ No Cursor backup found"

echo "♻️ Restoring SSH folder..."
mkdir -p ~/.ssh
cp -r "$BACKUP_DIR/ssh/"* ~/.ssh/ || echo "⚠️ No SSH backup found"
chmod 700 ~/.ssh
chmod 600 ~/.ssh/* || true
chmod 644 ~/.ssh/*.pub || true

echo "♻️ Restoring .zshrc..."
cp "$BACKUP_DIR/zsh/.zshrc" ~/.zshrc || echo "⚠️ No .zshrc backup found"

echo "✅ Restore complete!"
