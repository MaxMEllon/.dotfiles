#!/bin/sh

git submodule update --init
sh ~/.dotfiles/.zsh.d/init.sh
sh ~/.vim/install.sh

