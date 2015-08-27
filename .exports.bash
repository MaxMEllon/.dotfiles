export PATH=${HOME}/local/bin:${PATH}
export PATH=/usr/local/bin:${PATH}
export PATH=${HOME}/.rbenv/bin:${PATH}
export PATH=/opt/rh/qt48/root/usr/lib64/qt4/bin:${PATH}
export PAGER=less
export GOPATH=~/local/go
export PATH=~/local/go/bin/:${PATH}
export PATH=/usr/local/heroku/bin:${PATH}
export DOTFONTPATH=${HOME}/share/fonts
if [ `which rbenv` ]; then
  eval "$(rbenv init -)"
fi
