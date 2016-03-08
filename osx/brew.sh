#!/bin/bash

set -eu

if ! has "ruby"; then
  error_message 'PLEASE INSTALL ruby'
  exit 1
fi

if ! has "brew"; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if ! has "brew"; then
  error_message 'brew: failed to install'
  exit 1
fi

if ! has "git"; then
  brew install git
fi

if ! has "zsh"; then
  brew install zsh
fi

if ! has "tmux"; then
  brew install tmux
fi
