#!/bin/bash

set -eu

: $1

source $1/lib/conveni.sh

mkdir -p ~/local/bin

scripts=`ls $1/bin/`
for script in ${scripts[@]}; do
  if [ $script != 'init.sh' ]; then
    log="\t$1/bin/$script\t->\t~/local/bin"
    run $log
    ln -fs $1/bin/$script ~/local/bin &> /dev/null 2>&1 && ok $log || error $log
  fi
done

exit $?
