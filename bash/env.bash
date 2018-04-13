# See: http://qiita.com/ma2saka/items/f975fff5af6d48255e0a
export PAGER=less
export MANPAGER=less
export EDITOR=/usr/local/bin/vim
export GISTY_DIR=${HOME}/gisty
export GOPATH=${HOME}/local/go
export DOTFONTPATH=${HOME}/share/fonts
export NODE_PATH=$npm_dir
export TERM='xterm-256color'
export LANG=ja_JP.UTF-8
export KCODE=u
export LS_COLORS='di=01;34;40:ln=01;36:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export CLICOLOR=true

export FZF_DEFAULT_OPTS='--reverse'
export FZF_DEFAULT_COMMAND='
  (git ls-tree -r --name-only HEAD ||
       find . -path "*/\.*" -prune -o -type f -print -o -type l -print |
         sed s/^..//) 2> /dev/null'

# [ -s $HOME/.env ] && source $HOME/.env || touch $HOME/.env
