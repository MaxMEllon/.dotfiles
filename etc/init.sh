#!/bin/bash

set -eu

: $1

source ../lib/conveni.sh

rm -rf ~/.*rc
ln -s $1/etc/.*rc ~/ > /dev/null
rm -rf ~/.ctags
ln -s $1/etc/.ctags ~/ > /dev/null
exit $?
