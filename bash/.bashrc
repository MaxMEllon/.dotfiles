if [ -z ${DOTPATH+x} ]; then
  export DOTPATH="$HOME/.dotfiles"
fi

source $DOTPATH/bash/aliases.bash
source $DOTPATH/bash/prompt.bash

alias vi="vim"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
