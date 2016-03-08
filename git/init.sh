#!/bin/bash

set -eu

: $1

source $1/lib/conveni.sh

rm -rf ~/.gitconfig
ln -s $1/git/.gitconfig ~/
exit $?
