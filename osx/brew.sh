#!/bin/bash

set -eu

: $1

source $1/lib/conveni.sh

if ! has "ruby"; then
  error_message 'PLEASE INSTALL ruby'
  exit 1
fi

if ! has "brew"; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if ! has "brew"; then
  error_message 'brew: failed to install'
  exit 1
fi

_brew_install() {
  if ! has "$1"; then
    log "brew install $1"
    result
  else
    skip "brew install $1"
  fi
}

printf "\n"
printf "    " && _brew_install git
printf "    " && _brew_install zsh
printf "    " && _brew_install tmux

