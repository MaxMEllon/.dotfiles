case $(uname) in
  *BSD|Darwin)
    if [ -x "$(which gnuls)" ]; then
      alias ls="gnuls"
      alias la="ls -hAF --color=auto"
    else
      alias la="ls -hAFG"
    fi
    ;;
  SunOS)
    if [ -x "`which gls`" ]; then
      alias ls="gls"
      alias la="ls -hAF --color=auto"
    else
      alias la="ls -hAF"
    fi
    ;;
  *)
    alias la="ls -hAF --color=auto"
    ;;
esac

# grep
alias grep='grep --color=auto'
alias lg='ls -a | grep'

# git
alias gco='git checkout'
alias gcob='git checkout -b'
alias gb='git branch'

# cd ..
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# tmux
alias aliastx='alias | grep tmux'
alias tmls='\tmux list-sessions'
alias tmlc='\tmux list-clients'
alias killtmux='\tmux kill-server'
alias tmkl='\tmux kill-session'
alias tmaw='\tmux main-horizontal'
alias tmuxa='\tmux -2 a -t'

if [ "$SHLVL" -eq 1 ]; then
  alias tmx='tmux -2 new-session'
fi

# platuml
alias uml="java -jar ${HOME}/local/bin/plantuml.jar -tpng"

# rails
alias b='bundle'
alias be='bundle exec'
alias br='bin/rails'
alias railss='rails s -b 0.0.0.0'

# node
alias n='npm'
alias nr='npm run'
alias ne='PATH=node_modules/.bin:${PATH}'

# ag
alias ag="ag --pager=\"less -R\""

alias gyazo="gyazo-cli"

alias honyaku='google 翻訳'

alias :q='exit'
