#!/usr/bin/env bash

set -eo pipefail

macos_bootstrap="$(cd "$(dirname "$0")/.." && pwd -P)"
source "$macos_bootstrap/modules/functions.bash"

info_echo "Running macOS Software updates"
sudo softwareupdate -i -a

if [[ "$(uname -m)" == "arm64" ]] && ! pkgutil --pkg-info com.apple.pkg.Rosetta2.X86OnARM >/dev/null 2>&1; then
  info_echo "Install Rosetta 2"
  sudo softwareupdate --install-rosetta --agree-to-license
fi
