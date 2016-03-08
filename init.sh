#/bin/bash

DOTPATH=~/.dotfiles

if [ -n "$1" ]; then
  DOTPATH=$1
fi

set -eu

log () {
  printf " runnning -----> $1\n"
}

success() {
  printf "\e[32m success : $1 \e[0m\n"
}

error () {
  printf "\e[31m fail -----X $1 \e[0m\n"
}

log 'git submodule update --init'
git submodule update --init
[ $? -eq 0 ] && success 'git submodule update --init' || error 'git submodule update --init'

dists=('osx' 'etc' 'bash' 'zsh' 'vim' 'tmux' 'git')
for e in ${dists[@]}; do
  TARGET=$DOTPATH/$e/*.sh
  if [ -f $TARGET ]; then
    log $TARGET && bash $TARGET $DOTPATH
    [ $? -eq 0 ] && success $TARGET || error $TARGET
  else
    continue
  fi
done
