#!/usr/bin/env bash

# shellcheck source=functions.bash
source "$(dirname "${BASH_SOURCE[0]}")/functions.bash"

info_echo "Enable rbenv"
eval "$(rbenv init -)"

ruby_version="4.0.2"

if ! rbenv versions --bare | grep -qx "$ruby_version"; then
  info_echo "Install Ruby $ruby_version"
  rbenv install "$ruby_version"
fi

info_echo "Set Ruby $ruby_version as global default Ruby"
rbenv global "$ruby_version"

info_echo "Update to latest Rubygems and Bundler versions"
gem update --system --no-document
