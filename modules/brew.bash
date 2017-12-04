#!/usr/bin/env bash

macos_bootstrap="$(cd "$(dirname "$0")/.." && pwd -P)"
source "$macos_bootstrap/modules/functions.bash"

info_echo "Install Homebrew"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

info_echo "Install Brew formalue"
brew tap "Homebrew/bundle" 2> /dev/null
brew bundle --file="$macos_bootstrap/Brewfile"

# https://github.com/eventmachine/eventmachine/issues/602#issuecomment-152184551
info_echo "Link keg-only openssl to /usr/local to let software outside of Homebrew to find it"
brew unlink openssl && brew link openssl --force

info_echo "Link Curl with openssl"
brew link --force curl

info_echo "Remove outdated versions"
brew cleanup
brew cask cleanup
