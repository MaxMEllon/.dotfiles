#/bin/bash

DOTPATH=~/.dotfiles

if [ -n "$1" ]; then
  DOTPATH=$1
fi

set -eu

source $DOTPATH/lib/conveni.sh

logo

run "git submodule update --init"
git submodule update --init &> /dev/null || error "git submodule update --init"

# 並列実行できないもの

run "$DOTPATH/bash/init.sh"
bash "$DOTPATH/bash/init.sh" $DOTPATH || error "${script}"

dist=('osx' 'linux')
for type in ${dist[@]}; do
  for script in $DOTPATH/$type/*.sh; do
    if [ `os_type` == $type ]; then
      run $script
      bash $script $DOTPATH || error "${script}"
    else
      skip $script
      continue
    fi
  done
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
