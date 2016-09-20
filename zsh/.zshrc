myplug zsh/init.zsh

hasfile ~/.rbenv/bin/rbenv   && eval "$(~/.rbenv/bin/rbenv init - --no-rehash)"
hasfile ~/.exenv/bin/exenv   && eval "$(~/.exenv/bin/exenv init - --no-rehash)"
hasfile ~/.nodenv/bin/nodenv && eval "$(~/.nodenv/bin/nodenv init -)"
hasfile ~/.erlenv/bin/erlenv && eval "$(~/.erlenv/bin/erlenv init -)"

if hasenv $DOT_ZSHRC_DEBUG; then
  if (which zprof > /dev/null) ;then
    zprof | less
  fi
fi

if [ -z $TMUX ] && has tmux; then
  tmux -2
fi

