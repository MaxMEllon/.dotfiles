all: install

help:
	@echo "make init    "
	@echo "make update  "
	@echo "make deploy  "
	@echo "make install "

init:
	-bash etc/bin/init.sh

update:
	-bash etc/bin/update.sh

deploy:
	@echo 'dotfiles to directory'
	-bash etc/bin/deploy.sh

vim:
	-git clone https://github.com/MaxMEllon/.vim.git ~/.vim
	-pwd
	-sh ../.vim/install.sh
	-cd ../.vim
	-git submodule foreach 'git pull origin master; git checkout master'
	-git submodule update
	-cd -

install: init update deploy vim
	@exec $$SHELL
