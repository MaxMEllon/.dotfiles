#!/bin/sh
git submodule update
cd ~/.dotfiles/.zsh.d/
git pull origin master
git submodule update

