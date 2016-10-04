#!/usr/local/bin/zsh

set -eu

: ${DOTPATH?=$1}

source $DOTPATH/lib/conveni.sh

if ! has "zsh"; then
  error 'PLEASE INSTALL ZSH > 5.0.2'
  exit 1
fi

url="https://github.com/zplug/zplug"
if ! [ -d ~/.zplug ]; then
  run "git clone ${url} ~/.zplug"
  `git clone ${url} ~/.zplug` &> /dev/null && ok "\tgit clone $url" || error "\tgit clone $url"
else
  skip "git clone ${url} ~/.zplug"
fi

ls $DOTPATH/zsh/rc/*.zsh | xargs -P 10 -n 1- \
  zsh -fc 'zcompile $0 && printf "\e[32m ok\t: zcompile $0  \e[0m\n"'
ls $DOTPATH/zsh/functions/*.zsh | xargs -P 10 -n 1- \
  zsh -fc 'zcompile $0 &&printf "\e[32m ok\t: zcompile $0  \e[0m\n"'

ln -fs $DOTPATH/zsh/.zshrc ~/ &
ln -fs $DOTPATH/zsh/.zshenv ~/ &
ln -fs $DOTPATH/zsh/.zprofile ~/ &

wait

# if ! zplug check --verbose; then
#   zplug install
# fi

exit $?
