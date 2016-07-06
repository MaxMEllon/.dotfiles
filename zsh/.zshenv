# zmodload zsh/zprof && zprof

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if ! [ -z $DOTENV_LOADED ]; then
  print 'skip load\n'
else
  export PATH=${HOME}/local/bin:${PATH}
  export PATH=/usr/local/bin:${PATH}
  export PATH=${HOME}/.rbenv/bin:${PATH}
  export PATH=${HOME}/local/go/bin:${PATH}
  export PATH=/usr/local/heroku/bin:${PATH}
  export PATH=~/.zplug/bin:${PATH}
  export PAGER=less
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
  [ -s ${HOME}/.nvm/nvm.sh ] && . ${HOME}/.nvm/nvm.sh
  npm_dir=${NVM_PATH}_modules
  export DOTENV_LOADED=1
fi

