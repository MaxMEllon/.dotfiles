#!/bin/bash

# See: https://github.com/b4b4r07/dotfiles/blob/master/etc/install
# See: http://qiita.com/b4b4r07/items/24872cdcbec964ce2178

true=0
false=1

is_exists() {
  which $1 > /dev/null 2>&1
  return $?
}

lower() {
  printf "$1\n" | tr '[A-Z]' '[a-z]'
}

os_type() {
  if [[ "$(uname)" == 'Darwin' ]]; then
    lower 'Osx'
  elif [[ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]]; then
    lower 'Linux'
  elif [[ "$(expr substr $(uname -s) 1 10)" == 'MINGW32_NT' ]]; then
    lower 'Cygwin'
  else
    echo "Your platform ($(uname -a)) is not supported."
    exit 1
  fi
}

is_osx() {
  [[ `os_type` == "mac" ]] && return $true || return $false
}

is_linux() {
  [[ `os_type` == "linux" ]] && return $true || return $false
}

is_cygwin() {
  [[ `os_type` == "cygwin" ]] && return $true || return $false
}

has() {
  is_exists "$@"
}

error() {
  printf "\e[31m fail\t: $1  \e[0m\n"
}

run () {
  printf "\e[34m run\t: $1  \e[0m\n"
}

skip() {
  printf "\e[33m skip\t: $1  \e[0m\n"
}

ok() {
  printf "\e[32m ok\t: $1  \e[0m\n"
}

logo='
    _______   ______   .___________. _______  __   __       _______     _______.
   |       \ /  __  \  |           ||   ____||  | |  |     |   ____|   /       |
   |  .--.  |  |  |  | `---|  |----`|  |__   |  | |  |     |  |__     |   (----`
   |  |  |  |  |  |  |     |  |     |   __|  |  | |  |     |   __|     \   \
 __|  `--`  |  `--`  |     |  |     |  |     |  | |  `----.|  |____.----)   |
(__)_______/ \______/      |__|     |__|     |__| |_______||_______|_______/
'

logo () {
  printf "$logo\n\n"
}

