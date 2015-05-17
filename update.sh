#!/bin/sh

for path in ~/.dotfiles/.zsh.d/ ~/.vim
do
  cd $path
  git pull origin master
done

vim +":NeoBundleInstall" +:q
