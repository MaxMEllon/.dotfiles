# zmodload zsh/zprof && zprof
source ~/.dotfiles/lib/conveni.sh

exist_export()
{
  : $1
  [ -s $1 ] && export PATH=$1:$PATH
}


if [[ -z $TMUX ]]; then
  source ~/.dotfiles/bash/env.bash
  expath /usr/local/bin
  expath ${HOME}/local/bin
  expath ${HOME}/local/bin
  expath ${HOME}/local/go/bin
  expath ${HOME}/.zplug/bin:${PATH}
  exist_export ${HOME}/.exenv/bin/exenv
  exist_export ${HOME}/.rbenv/bin/rbenv
  exist_export ${HOME}/.erlenv/bin/erlenv
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
