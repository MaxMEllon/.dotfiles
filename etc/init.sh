#!/bin/bash

set -eu

: $1

source $1/lib/conveni.sh

ln -fs $1/etc/.*rc ~/ &> /dev/null 2>&1
ln -fs $1/etc/.ctags ~/ &> /dev/null 2>&1
ln -fs $1/etc/.agignore ~/ &> /dev/null 2>&1

rm -rf ~/.npmrc
cp $1/etc/.npmrc ~/ &> /dev/null 2>&1

exit $?
