export PATH=${HOME}/local/bin:${PATH}
export PATH=/usr/local/bin:${PATH}
export PATH=${HOME}/.rbenv/bin:${PATH}
export PATH=/opt/rh/qt48/root/usr/lib64/qt4/bin:${PATH}
export PATH=${HOME}/local/go/bin:${PATH}
export PAGER=less
export GISTY_DIR=${HOME}/gisty
export GOPATH=${HOME}/local/go
export PATH=~/local/go/bin/:${PATH}
export PATH=/usr/local/heroku/bin:${PATH}
export PATH=/opt/centos/devtoolset-1.1/root/usr/bin:${PATH}
export PATH=$HOME/.nodebrew/current/bin:$PATH
export DOTFONTPATH=${HOME}/share/fonts
if [ `which rbenv` ]; then
  eval "$(rbenv init -)"
fi
