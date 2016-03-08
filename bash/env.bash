export PATH=${HOME}/local/bin:${PATH}
export PATH=/usr/local/bin:${PATH}
export PATH=${HOME}/.rbenv/bin:${PATH}
export PATH=${HOME}/local/go/bin:${PATH}
export PAGER=less
export GISTY_DIR=${HOME}/gisty
export GOPATH=${HOME}/local/go
export PATH=/usr/local/heroku/bin:${PATH}
export DOTFONTPATH=${HOME}/share/fonts
if [ `which rbenv` ]; then
  eval "$(rbenv init -)"
fi
