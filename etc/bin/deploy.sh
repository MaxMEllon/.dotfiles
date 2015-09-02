#!/bin/sh

for file in .gitconfig .gitignore_global .minttyrc .tmux.d/.tmux.conf .zsh.d/.zshrc .inputrc .bashrc .pryrc
do
  ln -s .dotfiles/$file ~/
done

