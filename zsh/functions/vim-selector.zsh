if [[ `os_type` == 'osx' ]]; then
  export MY_VIM_TYPE='neogui'
else
  export MY_VIM_TYPE='cui'
fi

NEO_VIM_QT='/Users/maxmellon/work/ghq/github.com/equalsraf/neovim-qt/build/bin/nvim-qt'

select_vim_type() {
  if [ $# -ne 1 ]; then
    print "
    Error: Wrong number of arguments. Expected 1, got $#

      Usage:
        $ select_vim_type gui
        $ select_vim_type cui

      Alias:
        $ svim gui
        $ svim cui
    "
    return 1
  fi

  if [[ $1 == 'gui' ]]; then
    alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@" -g'
    alias v='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@" -g'
    export MY_VIM_TYPE='gui'
    vim_type
    return
  fi
  if [[ $1 == 'cui' ]]; then
    alias vim='/usr/local/bin/vim'
    alias v='/usr/local/bin/vim'
    export MY_VIM_TYPE='cui'
    vim_type
    return
  fi
  if [[ $1 == 'neo' ]]; then
    alias vim='/usr/local/bin/nvim'
    alias v='/usr/local/bin/nvim'
    export MY_VIM_TYPE='neo'
    vim_type
    return
  fi
  if [[ $1 == 'neogui' ]]; then
    alias vim="$NEO_VIM_QT"
    alias v="$NEO_VIM_QT"
    export MY_VIM_TYPE='neo'
    vim_type
    return
  fi
}

_select_vim_complete () {
  compadd gui cui neo neogui
}
compdef _select_vim_complete select_vim_type
compdef _select_vim_complete svim

toggle_vim_type () {
  if [ $# -ne 0 ]; then
    print "
    Error: Wrong number of arguments. Expected 0, got $#

      Usage:
        $ toggle_vim_type

      Alias:
        $ tvim
    "
    return 1
  fi
  if [[ $MY_VIM_TYPE == 'gui' ]]; then
    alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@" -g'
    vim_type
    export MY_VIM_TYPE='cui'
    return
  fi
  if [[ $MY_VIM_TYPE == 'cui' ]]; then
    alias vim='/usr/local/bin/vim'
    vim_type
    export MY_VIM_TYPE='neo'
    return
  fi
  if [[ $MY_VIM_TYPE == 'neo' ]]; then
    alias vim='/usr/local/bin/nvim'
    vim_type
    export MY_VIM_TYPE='gui'
    return
  fi
}

vim_type () {
  print "CURRENT_VIM_TYPE : ${MY_VIM_TYPE}\n"
}

alias tvim='toggle_vim_type'
alias svim='select_vim_type'
alias vt='vim_type'
