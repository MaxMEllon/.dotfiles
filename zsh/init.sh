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

for s in $DOTPATH/zsh/rc/*.zsh; do
  com="zsh -fc \"zcompile $s\""
  run "$com"
  eval $com &> /dev/null && ok "$com" || error "$com"
done

for s in $DOTPATH/zsh/functions/*.zsh; do
  com="zsh -fc \"zcompile $s\""
  run "$com"
  eval $com &> /dev/null && ok "$com" || error "$com"
done

ln -fs $DOTPATH/zsh/.zshrc ~/
ln -fs $DOTPATH/zsh/.zshenv ~/
ln -fs $DOTPATH/zsh/.zprofile ~/

# if ! zplug check --verbose; then
#   zplug install
# fi

exit $?
