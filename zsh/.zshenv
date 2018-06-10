if [ -z ${DOTPATH+x} ]; then
  export DOTPATH="$HOME/.dotfiles"
fi

myplug()
{
  source $DOTPATH/$1
}

myplug lib/conveni.sh

hasenv $DOT_ZSHRC_DEBUG && modload zsh/zprof && zprof

source $DOTPATH/bash/env.bash
