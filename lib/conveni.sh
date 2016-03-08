#!/bin/sh

# See: https://github.com/b4b4r07/dotfiles/blob/master/etc/install
# See: http://qiita.com/b4b4r07/items/24872cdcbec964ce2178

is_exists() {
  which $1 > /dev/null 2>&1
  return $?
}

has() {
  is_exists "$@"
}

error_message () {
  printf "\e[31m $1 \e[0m\n"
}

log () {
  printf " runnning -----> $1\n"
  eval $1
  [ $? -eq 0 ] && success "$1" || error "$1"
}

success() {
  printf "\e[32m success : $1 \e[0m\n"
}

error () {
  printf "\e[31m fail -----X $1 \e[0m\n"
}

