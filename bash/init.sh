#!/bin/bash

set -eu

: $1

source $1/lib/conveni.sh

rm -rf ~/.bashrc
ln -s $1/bash/.bashrc ~/
exit $?
