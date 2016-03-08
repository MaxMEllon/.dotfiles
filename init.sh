#/bin/bash

set -eu

DOTPATH=~/work/ghq/github.com/MaxMEllon/.dotfiles

: git submodule update --init

log () {
  printf " runnning -----> $1\n"
}

success() {
  printf "\e[32m success : $1 \e[0m\n"
}

error () {
  printf "\e[31m fail -----X $1 \e[0m\n"
}

dists=('osx' 'bash' 'zsh' 'etc' 'vim' 'tmux')
for e in ${dists[@]}; do
  TARGET=$DOTPATH/$e/*.sh
  if [ -f $TARGET ]; then
    log $TARGET && bash $TARGET
    [ $? -eq 0 ] && success $TARGET || error $TARGET
  else
    continue
  fi
done
