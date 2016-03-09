#!/bin/bash

set -eu

: $1

source $1/lib/conveni.sh

if ! has "zsh"; then
  error_message 'PLEASE INSTALL ZSH > 5.0.2'
  exit 1
fi

if ! [ -d ~/.zplug ]; then
  run "git clone https://github.com/b4b4r07/zplug ~/.zplug"
  git clone https://github.com/b4b4r07/zplug ~/.zplug &> /dev/null 2>&1
else
  skip "git clone https://github.com/b4b4r07/zplug ~/.zplug"
fi

touch ~/.zshenv

ln -fs $1/zsh/.zshrc ~/

zsh
source ~/.zshrc

if ! zplug check --verbose; then
  zplug install
fi

exit $?
