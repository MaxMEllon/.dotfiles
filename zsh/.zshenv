# zmodload zsh/zprof && zprof
source ~/.dotfiles/lib/conveni.sh

typeset -U path cdpath fpath manpath PATH

exist_expath()
{
  : $1
  [ -d $1 ] && expath $1
}


if [[ -z $TMUX ]]; then
  source ~/.dotfiles/bash/env.bash

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
