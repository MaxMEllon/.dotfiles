#!/bin/bash

set -eu

: $1

source $1/lib/conveni.sh

rm -rf ~/.tmux.conf
ln -s $1/tmux/.tmux.conf ~/.tmux.conf > /dev/null
exit $?
