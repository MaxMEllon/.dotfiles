#!/bin/bash

set -eu

: $1

if ! has "tmux"
  error_message 'PLEASE INSTALL BASH'
  exit 1
fi

rm -rf ~/.tmux.conf
ln -s $1/tmux/.tmux.conf ~/.tmux.conf > /dev/null
exit $?
