#!/usr/local/bin/zsh

set -eu

: $1

source $1/lib/conveni.sh

if ! has "zsh"; then
  error 'PLEASE INSTALL ZSH > 5.0.2'
  exit 1
fi

url="https://github.com/zplug/zplug"
if ! [ -d ~/.zplug ]; then
  run "git clone ${url} ~/.zplug"
  `git clone ${url} ~/.zplug` &> /dev/null && ok "\tgit clone $url" || error "\tgit clone $url"
else
  skip "${url} ~/.zplug"
fi


ln -fs $1/zsh/.zshrc ~/
ln -fs $1/zsh/.zshenv ~/
ln -fs $1/zsh/.zprofile ~/

# if ! zplug check --verbose; then
#   zplug install
# fi

exit $?
