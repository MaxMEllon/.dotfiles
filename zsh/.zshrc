my-load zsh/init.zsh

has rbenv && eval "$(rbenv init - --no-rehash)"
has exenv && eval "$(exenv init - --no-rehash)"
has nodenv && eval "$(nodenv init -)"
has erlenv && eval "$(erlenv init -)"

if hasenv $DOT_ZSHRC_DEBUG; then
  if (which zprof > /dev/null) ;then
    zprof | less
  fi
fi

if [ -z $TMUX ]; then
  tmux -2
fi

