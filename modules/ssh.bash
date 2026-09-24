#!/usr/bin/env bash

# shellcheck source=functions.bash
source "$(dirname "${BASH_SOURCE[0]}")/functions.bash"

ssh_key="$HOME/.ssh/id_ed25519"

if [[ ! -f "$ssh_key.pub" ]]; then
  info_echo "Generate SSH key"
  mkdir -p "$HOME/.ssh"
  chmod 700 "$HOME/.ssh"
  ssh-keygen -t ed25519 -f "$ssh_key"
fi

if ! gh auth status >/dev/null 2>&1; then
  info_echo "Log in to GitHub"
  gh auth login --git-protocol ssh --web
fi

if ! gh ssh-key list | grep -Fq "$(awk '{print $2}' "$ssh_key.pub")"; then
  info_echo "Add SSH key to GitHub"
  gh ssh-key add "$ssh_key.pub" --title "$(scutil --get ComputerName)"
fi
