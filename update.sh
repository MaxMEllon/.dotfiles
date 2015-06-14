#!/bin/sh
git submodule foreach 'git pull origin master; git checkout master'
git submodule update
