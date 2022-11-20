#!/usr/bin/env bash

macos_bootstrap="$(cd "$(dirname "$0")/.." && pwd -P)"
source "$macos_bootstrap/modules/functions.bash"

info_echo "Copying .zshrc to your user directory"

cp "$macos_bootstrap/dotfiles/zshrc" "$(cd ~ && pwd -P)/.zshrc"
