alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias less='less -r'                          # raw control characters
alias whence='type -a'                        # where, of a sort
alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour
case "${OSTYPE}" in
darwin*)
  alias ls="ls -G"
  ;;
linux*)
  alias ls='ls --color=tty'
  ;;
esac
alias ll='ls -l'                              # long list
alias lla='ls -l -a'
alias la='ls -A'                              # all but . and ..
alias l='ls -CF'                              #
alias h='history 15'
alias s='ls'
alias tmux='tmux -2'
