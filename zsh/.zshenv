if [ -z ${DOTPATH+x} ]; then
  export DOTPATH="$HOME/.dotfiles"
fi

myplug()
{
  source $DOTPATH/$1
}

myplug lib/conveni.sh

hasenv $DOT_ZSHRC_DEBUG && modload zsh/zprof && zprof

if [[ -z $TMUX ]]; then
  expath ${DOTPATH}/node_modules/.bin
  expath /usr/local/bin
  expath ${HOME}/local/bin
  expath ${HOME}/local/go/bin
  expath ${HOME}/.zplug/bin
  expath ${HOME}/.local/bin

  source $DOTPATH/bash/env.bash
fi
