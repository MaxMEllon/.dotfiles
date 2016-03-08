#/bin/bash

DOTPATH=~/.dotfiles

if [ -n "$1" ]; then
  DOTPATH=$1
fi

set -eu

source $DOTPATH/lib/conveni.sh

log "git submodule update --init"

dists=('osx' 'etc' 'bash' 'zsh' 'vim' 'tmux' 'git')
for e in ${dists[@]}; do
  TARGET=$DOTPATH/$e/*.sh
  if [ -f $TARGET ]; then
    log $TARGET
  else
    continue
  fi
done
