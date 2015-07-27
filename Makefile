all: install

help:
	@echo "make init    "
	@echo "make update  "
	@echo "make deploy  "
	@echo "make install "

init:
	-bash init.sh

update:
	-bash update.sh

deploy:
	@echo 'dotfiles to directory'
	-bash deploy.sh

vim:
	-sh ~/.vim/install.sh

install: init deploy
	@exec $$SHELL
