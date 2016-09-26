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

expath ~/.rbenv/bin && eval "$(rbenv init - --no-rehash)"
expath ~/.exenv/bin && eval "$(exenv init - --no-rehash)"
expath ~/.nodenv/bin && eval "$(nodenv init -)"
expath ~/.erlenv/bin && eval "$(erlenv init -)"

if hasenv $DOT_ZSHRC_DEBUG; then
  if (which zprof > /dev/null) ;then
    zprof | less
  fi
fi

if has tmux; then
  if ! hasenv $TMUX && hasprocess tmux; then
    session=$(tmux list-sessions | awk -F ':' 'NR==1 {print $1}')
    tmux attach -t $session
  elif ! hasenv $TMUX; then
    is_osx && tmux -2
  fi
fi

rmpath ~/.rbenv/bin
rmpath ~/.exenv/bin
rmpath ~/.nodenv/bin
rmpath ~/.erlenv/bin

remove_duplicated_path

