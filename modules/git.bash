#!/usr/bin/env bash

# shellcheck source=functions.bash
source "$(dirname "${BASH_SOURCE[0]}")/functions.bash"

git config --global core.editor "nano"
git -C "$macos_bootstrap" config core.hooksPath .githooks
