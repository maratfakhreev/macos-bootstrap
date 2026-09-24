#!/usr/bin/env bash

# shellcheck source=functions.bash
source "$(dirname "${BASH_SOURCE[0]}")/functions.bash"

if ! command -v brew >/dev/null 2>&1; then
  info_echo "Install Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  load_homebrew
fi

if ! command -v brew >/dev/null 2>&1; then
  error_echo "Homebrew is not available"
  exit 1
fi

info_echo "Install Brew formulae"
brew bundle --verbose --file="$macos_bootstrap/Brewfile"

info_echo "Remove outdated versions"
brew cleanup
