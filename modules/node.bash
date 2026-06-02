#!/usr/bin/env bash

macos_bootstrap="$(cd "$(dirname "$0")/.." && pwd -P)"
source "$macos_bootstrap/modules/functions.bash"
source "$(brew --prefix nvm)/nvm.sh"

info_echo "Install and set latest Node.js version as global default Node"
nvm install node
nvm use node
nvm alias default node

info_echo "Enable corepack"
corepack enable

export npm_config_global=true
export npm_config_loglevel=silent
