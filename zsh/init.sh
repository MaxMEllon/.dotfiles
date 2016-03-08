#!/bin/bash

set -eu

: $1

error_message () {
  printf "\e[31m $1 \e[0m\n"
}

which zsh > /dev/null
if [ $? -ne 0 ]; then
  error_message 'PLEASE INSTALL ZSH > 5.0.2'
  exit 1
fi

touch ~/.zshenv

rm -rf ~/.zshrc
ln -s $1/zsh/.zshrc ~/
exit $?
