#!/bin/sh

cd
for path in .dotfiles/.zsh.d .vim
do
  link=`echo $path | sed -e "s/.dotfiles\///g"`
  git clone https://github.com/maxmellon/${link}.git ${path}
done

cd
for file in .gitconfig .minttyrc .tmux.d/.tmux.conf .zsh.d/.zshrc .inputrc .bashrc .pryrc
do
  ln -s .dotfiles/$file
done

cd
sh ~/.vim/neo_bundle_install.sh
vim +":NeoBundleInstall" +:q
