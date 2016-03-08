#/bin/bash

DOTPATH=~/.dotfiles

if [ -n "$1" ]; then
  DOTPATH=$1
fi

set -eu

source $DOTPATH/lib/conveni.sh

logo

log "git submodule update --init"

dists=('bash' 'osx' 'etc' 'zsh' 'vim' 'tmux' 'git')
for e in ${dists[@]}; do
  for script in $DOTPATH/$e/*.sh; do
    if [ -f $script ]; then
      log $script $DOTPATH
      result
    else
      continue
    fi
  done
done
