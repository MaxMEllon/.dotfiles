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
else
  skip "install : brew"
fi

if ! has "brew"; then
  error_message 'brew: failed to install'
  exit 1
fi

_brew_tap() {
  eval "brew tap $@" &> /dev/null
}
_brew_install() {
  local cmd="brew install $1"
  if ! has "$1"; then
    run  "$cmd"
    eval "$cmd" &> /dev/null
  else
    skip "$cmd"
  fi
}

_brew_install wget &
_brew_install git &
_brew_install zsh &
_brew_install tmux &
_brew_install go &
_brew_install python &
_brew_install python3 &
_brew_install rbenv &
_brew_install ruby-build &
_brew_tap "peco/peco" && _brew_install peco &
_brew_install fzf &
_brew_install tig &
_brew_install ghq &
_brew_install ricty &
_brew_install rsense &

wait

exit

