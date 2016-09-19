if [ -z ${DOTPATH+x} ]; then
  export DOTPATH="$HOME/.dotfiles"
fi

my-load()
{
  source $DOTPATH/$1
}

my-load zsh/init.zsh

# if (which zprof > /dev/null) ;then
#   zprof | less
# fi
