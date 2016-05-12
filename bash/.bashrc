
if [ -z ${DOTPATH+x} ]; then
  export DOTPATH="$HOME/.dotfiles"
fi

source $DOTPATH/bash/aliases.bash
source $DOTPATH/bash/prompt.bash
source $DOTPATH/bash/env.bash

if [ `which rbenv` ]; then
  eval "$(rbenv init - --no-rehash)"
fi
