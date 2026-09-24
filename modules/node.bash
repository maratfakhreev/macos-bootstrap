#!/usr/bin/env bash

# shellcheck source=functions.bash
source "$(dirname "${BASH_SOURCE[0]}")/functions.bash"

export NVM_DIR="$HOME/.nvm"
mkdir -p "$NVM_DIR"

nvm_sh="$HOMEBREW_PREFIX/opt/nvm/nvm.sh"
if [[ ! -s "$nvm_sh" ]]; then
  error_echo "nvm is not installed (expected $nvm_sh). Run the brew module first"
  exit 1
fi

# nvm.sh is not guaranteed to be `set -e` safe
set +e
# shellcheck source=/dev/null
source "$nvm_sh"
set -e

if ! command -v nvm >/dev/null 2>&1; then
  error_echo "Failed to load nvm from $nvm_sh"
  exit 1
fi

info_echo "Install and set latest Node.js version as global default Node"
nvm install node
nvm use node
nvm alias default node

info_echo "Enable corepack"

if ! command -v corepack >/dev/null 2>&1; then
  npm install -g corepack
fi
corepack enable
