export PATH=${HOME}/local/bin:${PATH}
export PATH=/usr/local/bin:${PATH}
export PATH=${HOME}/.rbenv/bin:${PATH}
export PATH=${HOME}/local/go/bin:${PATH}
export PAGER=less
export GISTY_DIR=${HOME}/gisty
export GOPATH=${HOME}/local/go
export PATH=/usr/local/heroku/bin:${PATH}
export DOTFONTPATH=${HOME}/share/fonts
# See: http://qiita.com/ma2saka/items/f975fff5af6d48255e0a
if [ `which rbenv` ]; then
  if $(which comparguments 2>/dev/null | grep 'built-in command' > /dev/null); then
    eval "$(rbenv init - zsh)"
  fi
  eval "$(rbenv init -)"
fi
test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex"
