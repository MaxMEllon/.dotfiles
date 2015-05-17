#!/bin/sh

cd
for path in .dotfiles/.zsh.d .vim
do
  link=`echo $path | sed -e "s/.dotfiles\///g"`
  git clone https://github.com/maxmellon/${link}.git ${path}
done

cd
for file in .dotfiles/.gitconfig .dotfiles/.minttyrc .dotfiles/.tmux.d/.tmux.conf .dotfiles/.zsh.d/.zshrc .vim/.vimrc .dotfiles/.inputrc .dotfiles/.bashrc
do
  ln -s $file
done

cd
sh ~/.vim/neo_bundle_install.sh
vim +":NeoBundleInstall" +:q
