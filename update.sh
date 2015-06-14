#!/bin/sh
git submodule update
cd .zsh.d
git pull origin master
git submodule update

