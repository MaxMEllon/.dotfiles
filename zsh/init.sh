#!/bin/bash

set -eu

: $1

source ../lib/conveni.sh

if ! has "zsh"; then
  error_message 'PLEASE INSTALL ZSH > 5.0.2'
  exit 1
fi

touch ~/.zshenv

rm -rf ~/.zshrc
ln -s $1/zsh/.zshrc ~/
exit $?
