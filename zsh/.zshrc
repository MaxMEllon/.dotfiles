####
# This comment for `gf` of vim
#
# ~/.dotfiles/zsh/rc/init.zsh
#   ~/.dotfiles/zsh/rc/zplug.zsh
#   ~/.dotfiles/zsh/rc/opt.zsh
#   ~/.dotfiles/zsh/rc/alias.zsh
#   ~/.dotfiles/zsh/rc/prompt.zsh
#   ~/.dotfiles/zsh/rc/history.zsh
#   ~/.dotfiles/zsh/functions/*.zsh
#   ~/.dotfiles/zsh/rc/misc.zsh
#   ~/.dotfiles/zsh/rc/bind.zsh
#

myplug zsh/rc/init.zsh
source ~/.env

for env in $ANY_ENV_LIST; do
  expath "$HOME/.$env/bin" && eval "$($env init -)" && echo "[env]\t$env\tis loaded"
done

expath ~/.yarn/bin

if hasenv $DOT_ZSHRC_DEBUG; then
  if (which zprof > /dev/null) ;then
    zprof | less
  fi
fi

if has \tmux; then
  if hasprocess tmux; then
    if ! hasenv $TMUX; then
      session=$(\tmux list-sessions | awk -F ':' 'NR==1 {print $1}')
      \tmux attach -t $session
    fi
  else
    is_osx && tmux -2
  fi
fi

remove_duplicated_path

