if [ -z ${DOTPATH+x} ]; then
  export DOTPATH="$HOME/.dotfiles"
fi

myplug()
{
  source $DOTPATH/$1
}

myplug lib/conveni.sh

hasenv $DOT_ZSHRC_DEBUG && modload zsh/zprof && zprof

exist_expath()
{
  : $1
  [ -d $1 ] && expath $1
}


if [[ -z $TMUX ]]; then
  myplug bash/env.bash

  expath /usr/local/bin
  expath ${HOME}/local/bin
  expath ${HOME}/local/bin
  expath ${HOME}/local/go/bin
  expath ${HOME}/.zplug/bin:${PATH}

  exist_expath ${HOME}/.exenv/bin
  exist_expath ${HOME}/.rbenv/bin
  exist_expath ${HOME}/.erlenv/bin
  exist_expath ${HOME}/.nodenv/bin
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
