#!/bin/bash

set -eu

: $1

source $1/lib/conveni.sh

if ! has "ruby"; then
  error 'ruby: PLEASE INSTALL ruby'
  exit 1
fi

if ! has "brew"; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  skip "install : brew"
fi

if ! has "brew"; then
  error 'brew: failed to install'
  exit 1
fi

_brew_tap() {
  local cmd="brew tap $@"
  `$cmd` &> /dev/null && ok "\t$cmd" || error "\t$cmd"
}
_brew_install() {
  local cmd="brew install $1"
  if ! has "$1"; then
    run  "\t$cmd"
    `$cmd` &> /dev/null && ok "\t$cmd" || error "\t$cmd"
  else
    skip "\t$cmd"
  fi
}

_brew_install wget
_brew_install git
_brew_install zsh
_brew_install tmux
_brew_install go
_brew_install python
_brew_install python3
_brew_install rbenv
_brew_install ruby-build
_brew_tap "peco/peco" && _brew_install peco
_brew_install fzf
_brew_install tig
_brew_tap "motemen/ghq" && _brew_install ghq
_brew_install rsense
_brew_install ag

wait

exit

