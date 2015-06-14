#!/bin/sh

git submodule update --init
for file in .gitconfig .minttyrc .tmux.d/.tmux.conf .zsh.d/.zshrc .inputrc .bashrc .pryrc
do
  ln -s .dotfiles/$file ~/
done

sh ~/.dotfiles/.zsh.d/init.sh
sh ~/.vim/install.sh
