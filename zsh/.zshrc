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

hasfile ~/.rbenv/bin/rbenv   && eval "$(~/.rbenv/bin/rbenv init - --no-rehash)"
hasfile ~/.exenv/bin/exenv   && eval "$(~/.exenv/bin/exenv init - --no-rehash)"
hasfile ~/.nodenv/bin/nodenv && eval "$(~/.nodenv/bin/nodenv init -)"
hasfile ~/.erlenv/bin/erlenv && eval "$(~/.erlenv/bin/erlenv init -)"

if hasenv $DOT_ZSHRC_DEBUG; then
  if (which zprof > /dev/null) ;then
    zprof | less
  fi
fi

if has tmux; then
  if [ -z $TMUX ] && hasprocess tmux; then
    session=$(tmux list-sessions | awk -F ':' 'NR==1 {print $1}')
    tmux attach -t $session
  elif [ -z $TMUX ]; then
    is_osx && tmux -2
  fi
fi

