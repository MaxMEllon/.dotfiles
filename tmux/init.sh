#!/bin/bash

set -eu

: $1

source $1/lib/conveni.sh

if ! has "tmux"; then
  error_message 'PLEASE INSTALL BASH'
  exit 1
fi

rm -rf ~/.tmux.conf
ln -s $1/tmux/.tmux.conf ~/.tmux.conf > /dev/null
exit $?
