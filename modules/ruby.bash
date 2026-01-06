#!/usr/bin/env bash

macos_bootstrap="$(cd "$(dirname "$0")/.." && pwd -P)"
source "$macos_bootstrap/modules/functions.bash"

info_echo "Enable rbenv alias"
eval "$(rbenv init -)"

ruby_version="3.4.8"

if test -z "$(rbenv versions --bare|grep $ruby_version)"; then
  info_echo "Install Ruby $ruby_version"
  rbenv install $ruby_version
fi

info_echo "Set Ruby $ruby_version as global default Ruby"
rbenv global $ruby_version
rbenv shell $ruby_version

info_echo "Update to latest Rubygems version"
gem update --system --no-document

info_echo "Install Bundler to handle project-specific Ruby gems"
gem install bundler --no-document
