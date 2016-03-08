#!/bin/bash

set -eu

: $1

if ! has "bash"
  error_message 'PLEASE INSTALL BASH'
  exit 1
fi

rm -rf ~/.bashrc
ln -s $1/bash/.bashrc ~/
exit $?
