#!/bin/bash

set -eu

: $1

source $1/lib/conveni.sh

ln -fs $1/tmux/.tmux.conf ~/.tmux.conf > /dev/null
exit $?
