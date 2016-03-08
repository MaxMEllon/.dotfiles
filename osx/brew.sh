#!/bin/bash

set -eu

error_message () {
  printf "\e[31m $1 \e[0m\n"
}

which ruby > /dev/null
if [ $? -ne 0 ]; then
  error_message 'PLEASE INSTALL ruby'
  exit 1
fi

which brew > /dev/null
if [ $? -ne 0 ]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

which brew > /dev/null
if [ $? -ne 0 ]; then
  error_message 'brew: failed to install'
  exit 1
fi

which git > /dev/null
if [ $? -ne 0 ]; then
  brew install git
fi

which zsh > /dev/null
if [ $? -ne 0 ]; then
  brew install zsh
fi

which tmux > /dev/null
if [ $? -ne 0 ]; then
  brew install tmux
fi
