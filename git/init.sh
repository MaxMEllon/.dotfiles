#!/bin/bash

set -eu

: $1

if ! has "git"; then
  error_message 'PLEASE INSTALL BASH'
  exit 1
fi

rm -rf ~/.gitconfig
ln -s $1/git/.gitconfig ~/
exit $?
