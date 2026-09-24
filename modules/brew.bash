#!/usr/bin/env bash

set -eo pipefail

macos_bootstrap="$(cd "$(dirname "$0")/.." && pwd -P)"
source "$macos_bootstrap/modules/functions.bash"

if ! command -v brew >/dev/null 2>&1; then
  info_echo "Install Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  load_homebrew
fi

if ! command -v brew >/dev/null 2>&1; then
  error_echo "Homebrew is not available"
  exit 1
fi

brew_bin="$(command -v brew)"
zprofile="$HOME/.zprofile"
if [[ ! -f "$zprofile" ]] || ! grep -Fqs 'brew shellenv' "$zprofile"; then
  info_echo "Add Homebrew to PATH"
  {
    echo
    echo "eval \"\$($brew_bin shellenv)\""
  } >> "$zprofile"
fi

info_echo "Install Brew formulae"
brew bundle --verbose --file="$macos_bootstrap/Brewfile"

info_echo "Remove outdated versions"
brew cleanup
