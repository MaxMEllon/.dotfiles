
if [ -z ${DOTPATH+x} ]; then
  export DOTPATH="$HOME/.dotfiles"
fi

source $DOTPATH/bash/aliases.bash
source $DOTPATH/bash/prompt.bash
source $DOTPATH/bash/env.bash

if [ `which rbenv` ]; then
  eval "$(rbenv init - --no-rehash)"
fi
if [ `which pyenv` ]; then
  eval "$(pyenv init - --no-rehash)"
fi
export NODE_PATH=:/Users/maxmellon/.nvm/versions/node/v5.8.0/lib/node_modules
