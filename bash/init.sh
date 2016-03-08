#!/bin/bash

set -eu

: $1

source ../lib/conveni.sh

if ! has "bash"
  error_message 'PLEASE INSTALL BASH'
  exit 1
fi

rm -rf ~/.bashrc
ln -s $1/bash/.bashrc ~/
exit $?
