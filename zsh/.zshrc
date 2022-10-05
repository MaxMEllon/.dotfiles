####
# This comment for `gf` of vim
#
# ~/.dotfiles/zsh/rc/init.zsh
#   ~/.dotfiles/zsh/rc/zplug.zsh
#   ~/.dotfiles/zsh/rc/opt.zsh
#   ~/.dotfiles/zsh/rc/alias.zsh
#   ~/.dotfiles/zsh/rc/prompt.zsh
#   ~/.dotfiles/zsh/rc/history.zsh
#   ~/.dotfiles/zsh/functions/*.zsh
#   ~/.dotfiles/zsh/rc/misc.zsh
#   ~/.dotfiles/zsh/rc/bind.zsh
#

umask 022
limit coredumpsize 0

expath /usr/local/bin

expath ~/.yarn/bin
expath ${DOTPATH}/node_modules/.bin
expath ${HOME}/local/go/bin
expath ${HOME}/.zplug/bin
# expath ${HOME}/.local/bin
expath ${HOME}/local/bin
expath /opt/homebrew/bin

[ -f ~/.env ] && source ~/.env

for env in $ANY_ENV_LIST; do
  expath "$HOME/.$env/bin" && eval "$($env init -)" && echo "[env]\t$env\tis loaded"
  expath "$HOME/.$env/shims"
done

myplug zsh/rc/init.zsh

if hasenv $DOT_ZSHRC_DEBUG; then
  if (which zprof > /dev/null) ;then
    zprof | less
  fi
fi

# rmpath "${HOME}/.nodenv/shims"

[ -f ~/.local.alias ] && source ~/.local.alias
# [ -f ~/.cargo/env ] && source ~/.cargo/env

# if has \tmux; then
#   if hasprocess tmux; then
#     if ! hasenv $TMUX; then
#       session=$(\tmux list-sessions | awk -F ':' 'NR==1 {print $1}')
#       \tmux attach -t $session
#     fi
#   else
#     is_osx && tmux -2
#   fi
# fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(direnv hook zsh)"

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
  print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
  command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
  command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
    print -P "%F{33} %F{34}Installation successful.%f%b" || \
    print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
  zdharma-continuum/zinit-annex-as-monitor \
  zdharma-continuum/zinit-annex-bin-gem-node \
  zdharma-continuum/zinit-annex-patch-dl \
  zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk
