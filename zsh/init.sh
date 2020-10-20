#!/usr/local/bin/zsh

set -eu

DOTPATH=~/.dotfiles

source $DOTPATH/lib/conveni.sh

if ! has "zsh"; then
  error 'PLEASE INSTALL ZSH > 5.0.2'
  exit 1
fi

if ! [ -d ~/.zinit ]; then
  run "install zinit"
  mkdir ~/.zinit
  git clone https://github.com/zdharma/zinit.git ~/.zinit/bin
else
  skip "install zinit"
fi

autoload -U zcompile

for f in $DOTPATH/zsh/rc/*.zsh; do
  zcompile $f && printf "\e[32m ok\t: zcompile $1  \e[0m\n" &
done

for f in $DOTPATH/zsh/functions/*.zsh; do
  echo $f
  zcompile $f && printf "\e[32m ok\t: zcompile $1  \e[0m\n" &
done

ln -fs $DOTPATH/zsh/.zshrc ~/ &
ln -fs $DOTPATH/zsh/.zshenv ~/ &
ln -fs $DOTPATH/zsh/.zprofile ~/ &

wait

# if ! zplug check --verbose; then
#   zplug install
# fi

exit $?
