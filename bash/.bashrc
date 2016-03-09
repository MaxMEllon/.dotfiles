
test $DOTPATH

if [ $? -ne 0 ]; then
  export $DOTPATH=~/.dotfiles
else
  export $DOTPATH
fi

source $DOTPATH/bash/aliases.bash
source $DOTPATH/bash/prompt.bash
source $DOTPATH/bash/env.bash

test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex"
