set -eo pipefail

# Not used on apple silicon based computers.
# Default path is using for it is /opt/homebrew/opt/rbenv, /opt/homebrew/opt/nvm e.t.c
# export RBENV_ROOT=/usr/local/var/rbenv
# export NVM_DIR=/usr/local/var/nvm

load_homebrew() {
  local brew_bin=""
  if [[ -x /opt/homebrew/bin/brew ]]; then
    brew_bin=/opt/homebrew/bin/brew
  elif [[ -x /usr/local/bin/brew ]]; then
    brew_bin=/usr/local/bin/brew
  fi

  if [[ -n "$brew_bin" ]]; then
    eval "$("$brew_bin" shellenv)"
  fi
}

load_homebrew()

if [[ -t 1 ]] && command -v tput >/dev/null 2>&1 && tput setaf 1 >/dev/null 2>&1; then
  red=$(tput setaf 1)
  green=$(tput setaf 2)
  color_reset=$(tput sgr0)
else
  red=""
  green=""
  color_reset=""
fi

error_echo() {
  printf "\n${red}%s.${color_reset}\n" "$1"
}

info_echo() {
  printf "\n${green}%s ...${color_reset}\n" "$1"
}

catch_exit() {
  ret=$?
  test $ret -ne 0 && error_echo "Installation fails" >&2
  exit $ret
}

# Catch exit
trap catch_exit EXIT
