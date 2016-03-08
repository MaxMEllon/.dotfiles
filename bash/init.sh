#!/bin/bash

set -eu

: $1

source $1/lib/conveni.sh

ln -fs $1/bash/.bashrc ~/ &> /dev/null 2>&1
exit $?
