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

run () {
  printf "\e[32m run\t: $1  \e[0m\n"
}

skip() {
  printf "\e[33m skip\t: $1  \e[0m\n"
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

