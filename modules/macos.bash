#!/usr/bin/env bash

macos_bootstrap="$(cd "$(dirname "$0")/.." && pwd -P)"
source "$macos_bootstrap/modules/functions.bash"

info_echo "Running macOS Software updates"
sudo softwareupdate -i -a

info_echo "Install Rosetta 2"
sudo softwareupdate --install-rosetta
