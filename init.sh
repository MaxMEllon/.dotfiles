#!/bin/sh

git submodule update --init
sh ~/.dotfiles/.zsh.d/init.sh
sh ~/.vim/install.sh

if [ $? -nq 0 ]; then
  echo "error" >&2
  exit 1
fi

echo "$0: success"

