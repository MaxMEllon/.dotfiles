#!/bin/bash

set -eu

: $1

error_message () {
  printf "\e[31m $1 \e[0m\n"
}

which bash > /dev/null
if [ $? -ne 0 ]; then
  error_message 'PLEASE INSTALL BASH'
  exit 1
fi

rm -rf ~/.bashrc
ln -s $1/bash/.bashrc ~/
exit $?
