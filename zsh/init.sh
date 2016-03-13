#!/bin/bash

set -eu

: $1

source $1/lib/conveni.sh

if ! has "zsh"; then
  error 'PLEASE INSTALL ZSH > 5.0.2'
  exit 1
fi

url="https://github.com/b4b4r07/zplug"
if ! [ -d ~/.zplug ]; then
  run "git clone ${url} ~/.zplug"
  `git clone ${url} ~/.zplug` &> /dev/null && ok "\tgit clone" || error "\tgit clone"
else
  skip "${url} ~/.zplug"
fi

touch ~/.zshenv

ln -fs $1/zsh/.zshrc ~/

zsh <<EOF
source ~/.zshrc
zplug install
EOF
