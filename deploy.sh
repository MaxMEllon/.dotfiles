#!/bin/sh

for file in .gitconfig .minttyrc .tmux.d/.tmux.conf .zsh.d/.zshrc .inputrc .bashrc .pryrc
do
  ln -s .dotfiles/$file ~/
done

