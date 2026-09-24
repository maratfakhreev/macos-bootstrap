#!/usr/bin/env bash

set -eo pipefail

macos_bootstrap="$(cd "$(dirname "$0")/.." && pwd -P)"
source "$macos_bootstrap/modules/functions.bash"

git config --global core.editor "nano"
