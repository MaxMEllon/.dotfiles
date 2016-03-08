#!/bin/bash

set -eu

: $1

source $1/lib/conveni.sh

export GOPATH=${HOME}/local/go

_go_get() {
  local cmd=`echo $1 | sed -e s@.*/.*/@@g`
  if ! has "$cmd"; then
    run "go get $1"
    eval "go get $1"
  else
    skip "go get $1"
  fi
}

_go_get "github.com/kroton/kome" &
_go_get "github.com/mattn/jvgrep" &
_go_get "github.com/Tomohiro/gyazo-cli" &

wait

exit

