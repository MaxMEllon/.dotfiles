if [ -z ${DOTPATH+x} ]; then
  export DOTPATH="$HOME/.dotfiles"
fi

source $DOTPATH/bash/aliases.bash
source $DOTPATH/bash/prompt.bash
source $DOTPATH/bash/env.bash

if [ `which rbenv` ]; then
  eval "$(rbenv init - --no-rehash)"
fi

# if [ `which pyenv` ]; then
#   eval "$(pyenv init - --no-rehash)"
# fi

if [ `which erlenv` ]; then
  eval "$(erlenv init - --norehash)"
fi

if [ `which exenv` ]; then
  eval "$(exenv init - --norehash)"
fi

