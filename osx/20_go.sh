#!/bin/bash

set -eu

: $1

source $1/lib/conveni.sh

_go_get() {
  local cmd=`echo $1 | sed -e s@.*/.*/@@g`
  if ! has "$cmd"; then
    log "go get $1"
    result
  else
    skip "go get $1"
  fi
}

printf "\n"
printf "    " && _go_get "github.com/kroton/kome"
printf "    " && _go_get "github.com/mattn/jvgrep"
printf "    " && _go_get "github.com/Tomohiro/gyazo-cli"

