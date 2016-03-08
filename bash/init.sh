#!/bin/bash

set -eu

: $1

source $1/lib/conveni.sh

if ! has "bash"; then
  error_message 'PLEASE INSTALL BASH'
  exit 1
fi

rm -rf ~/.bashrc
ln -s $1/bash/.bashrc ~/
exit $?
