#!/bin/sh

git submodule update --init
sh .zsh.d/init.sh

if [ $? -nq 0 ]; then
  echo "error" >&2
  exit 1
fi

echo "$0: success"

