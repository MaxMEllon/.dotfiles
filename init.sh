#/bin/bash

# export DOTPATH=~/.dotfiles

if [ -n "$1" ]; then
  DOTPATH=$1
fi

set -eu

source $DOTPATH/lib/conveni.sh

logo

# 並列実行できないもの
script="$DOTPATH/bash/init.sh"
run "$script"
bash "$script" $DOTPATH  && ok "$script" || error "$script"

# OS依存のもの
dist=('osx' 'linux')
for type in ${dist[@]}; do
  for script in $DOTPATH/$type/*.sh; do
    if [ `os_type` == $type ]; then
      run $script
      bash $script $DOTPATH && ok "$script" || error "$script"
    else
      skip $script
      continue
    fi
  done
done

# 並列実行できるもの
dists=('etc' 'tmux' 'git' 'bin')
for e in ${dists[@]}; do
  for script in $DOTPATH/$e/*.sh; do
    if [ -f $script ]; then
      run $script
      bash $script $DOTPATH && ok "$script" || error "$script" &
    else
      continue
    fi
  done
done

# zsh のインストールスクリプトは zsh で実行
script="$DOTPATH/zsh/init.sh"
zsh $script $DOTPATH && ok "$script" || error "$script" &

wait

exit
