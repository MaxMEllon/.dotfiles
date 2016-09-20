if [ -z ${DOTPATH+x} ]; then
  export DOTPATH="$HOME/.dotfiles"
fi

my-load()
{
  source $DOTPATH/$1
}

my-load zsh/init.zsh

has rbenv && eval "$(rbenv init - --no-rehash)"
has exenv && eval "$(exenv init - --no-rehash)"
has nodenv && eval "$(nodenv init -)"
has erlenv && eval "$(erlenv init -)"

# if (which zprof > /dev/null) ;then
#   zprof | less
# fi

if [ -z $TMUX ]; then
  tmux -2
fi

