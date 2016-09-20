if [ -z ${DOTPATH+x} ]; then
  export DOTPATH="$HOME/.dotfiles"
fi

my-load()
{
  source $DOTPATH/$1
}

my-load zsh/init.zsh

has rbenv && eval "$(rbenv init - --no-rehash)"
has exenv && eval "$(exenv init -)"
has erlenv && eval "$(erlenv init -)"

[ -s ${HOME}/.nvm/nvm.sh ] && . ${HOME}/.nvm/nvm.sh

# if (which zprof > /dev/null) ;then
#   zprof | less
# fi
