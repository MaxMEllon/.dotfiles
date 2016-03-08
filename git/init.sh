#!/bin/bash

set -eu

: $1

source $1/lib/conveni.sh

ln -fs $1/git/.gitconfig ~/
exit $?
