#/bin/bash

DOTPATH=~/.dotfiles

if [ -n "$1" ]; then
  DOTPATH=$1
fi

set -eu

source $DOTPATH/lib/conveni.sh

logo

run "git submodule update --init"
eval "git submodule update --init" &> /dev/null 2>&1

# 並列実行できないもの

run "$DOTPATH/bash/init.sh"
bash "$DOTPATH/bash/init.sh" $DOTPATH

for script in $DOTPATH/osx/*.sh; do
  if [ -f $script ] && is_osx; then
    run $script
    bash $script $DOTPATH
  else
    continue
  fi
done

# 並列実行できるもの
dists=('etc' 'zsh' 'vim' 'tmux' 'git')
for e in ${dists[@]}; do
  for script in $DOTPATH/$e/*.sh; do
    if [ -f $script ]; then
      run $script
      bash $script $DOTPATH &
    else
      continue
    fi
  done
done

wait

exit
