#!/usr/bin/env bash

# shellcheck source=functions.bash
source "$(dirname "${BASH_SOURCE[0]}")/functions.bash"

for dotfile in zshrc zprofile; do
  source_path="$macos_bootstrap/dotfiles/$dotfile"
  target_path="$HOME/.$dotfile"

  if [[ -e "$target_path" && ! -L "$target_path" ]]; then
    info_echo "Backing up existing $target_path to $target_path.bak"
    mv "$target_path" "$target_path.bak"
  fi

  info_echo "Linking $target_path to $source_path"
  ln -sfn "$source_path" "$target_path"
done
