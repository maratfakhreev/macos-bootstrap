export HOMEBREW_CASK_OPTS="--appdir=/Applications"
# Not used on apple silicon based computers.
# Default path is using for it is /opt/homebrew/opt/rbenv, /opt/homebrew/opt/nvm e.t.c
# export RBENV_ROOT=/usr/local/var/rbenv
# export NVM_DIR=/usr/local/var/nvm

red=$(tput setaf 1)
green=$(tput setaf 2)
color_reset=$(tput sgr0)

error_echo() {
  printf "\n${red}%s.${color_reset}\n" "$1"
}

info_echo() {
  printf "\n${green}%s ...${color_reset}\n" "$1"
}

version() {
  echo "$@" | awk -F. '{ printf("%d%03d%03d%03d\n", $1,$2,$3,$4); }'
}

catch_exit() {
  ret=$?
  test $ret -ne 0 && error_echo "Installation fails" >&2
  exit $ret
}

# Catch exit
trap catch_exit EXIT
