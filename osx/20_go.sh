#!/bin/bash

set -eu

: $1

source $1/lib/conveni.sh

export GOPATH=${HOME}/local/go

_go_get() {
  local cmd=`echo $1 | sed -e s@.*/.*/@@g`
  local runcmd="go get $1"
  if ! has "$cmd"; then
    run "$runcmd"
    `$runcmd` &> /dev/null && ok "\t$runcmd" || error "\t$runcmd"
  else
    skip "\t$runcmd"
  fi
}

_go_get "github.com/kroton/kome" &
_go_get "github.com/mattn/jvgrep" &
_go_get "github.com/Tomohiro/gyazo-cli" &
_go_get "github.com/mattn/files" &

wait

exit

