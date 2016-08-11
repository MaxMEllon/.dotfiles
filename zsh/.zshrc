logo='
                               _ _
                              | | |
 ____   ____ _   _ ____   ____| | | ___  ____
|    \\ / _  ( \\ / )    \\ / _  ) | |/ _ \\|  _ \\
| | | ( ( | |) X (| | | ( (/ /| | | |_| | | | |
|_|_|_|\\_||_(_/ \\_)_|_|_|\\____)_|_|\\___/|_| |_|

'

printf $logo

source ~/.zplug/zplug

local sources=$HOME/.zplug/repos

# zplug 'hchbaw/auto-fu.zsh', at:next
zplug 'b4b4r07/zspec', as:command, use:bin/zspec
# zplug 'mollifier/cd-gitroot', as:command, use:cd-gitroot
zplug 'mrowa44/emojify', as:command
zplug 'rupa/z', use:z.sh
zplug 'supercrabtree/k'
zplug 'zsh-users/zsh-autosuggestions'
zplug 'zsh-users/zsh-completions'
zplug 'zsh-users/zsh-syntax-highlighting', nice:10

zplug load --verbose

# k
if [ -d $sources/supercrabtree/k ]; then
  alias ll='k --no-vcs'
  alias lla='k -a --no-vcs'
fi

# auto-fu.zsh
if [ -d $sources/hchbaw/auto-fu.zsh ]; then
  function zle-line-init() { auto-fu-init }
  zle -N zle-line-init
  zstyle ':auto-fu:var' postdisplay $''
fi

autoload -U compinit
compinit

source ~/.bashrc

# comp {{{
zstyle ':completion:*' menu select
zstyle ':completion:*' format '%B%d%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' keep-prefix
zstyle ':completion:*' ignore-parents parent pwd ..
zstyle ':completion:*:sudo:*' command-path \
      /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
zstyle ':completion:*:processes' command 'ps x -o pid, s, args'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:default' menu select=1
# }}}

# config {{{
bindkey -e                  # ライン操作はEmacsスタイルで行う
setopt print_eight_bit      # 日本語ファイル名を表示可能にする
setopt no_beep              # beep を無効にする
setopt no_flow_control      # フローコントロールを無効にする
setopt interactive_comments # '#' 以降をコメントとして扱う
setopt auto_cd              # ディレクトリ名だけでcdする
setopt auto_pushd           # cd したら自動的にpushdする
setopt pushd_ignore_dups    # 重複したディレクトリを追加しない
setopt magic_equal_subst    # = の後はパス名として補完する
setopt share_history        # 同時に起動したzshの間でヒストリを共有する
setopt hist_ignore_all_dups # 同じコマンドをヒストリに残さない
setopt hist_save_nodups     # ヒストリファイルに保存するとき、すでに重複したコマンドがあったら古い方を削除する
setopt hist_ignore_space    # スペースから始まるコマンド行はヒストリに残さない
setopt hist_reduce_blanks   # ヒストリに保存するときに余分なスペースを削除する
setopt auto_menu            # 補完候補が複数あるときに自動的に一覧表示する
setopt prompt_subst         # プロンプト定義内で変数置換やコマンド置換を扱う
setopt list_types           # 補完候補一覧でファイルの種別をマーク表示
setopt auto_list            # 補完候補を一覧表示
setopt list_packed          # 補完候補を詰めて表示
setopt auto_param_keys      # カッコの対応などを自動的に補完
setopt noautoremoveslash    # 最後のスラッシュを自動的に削除しない
setopt notify               # バックグラウンドジョブの状態変化を即時報告
# }}}

# prompt {{{
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats \
  '(%{%F{white}%K{green}%}%s%{%f%k%})-[%{%F{white}%K{blue}%}%b%{%f%k%}]'
zstyle ':vcs_info:*' actionformats \
  '(%{%F{white}%K{green}%}%s%{%f%k%})-[%{%F{white}%K{blue}%}%b%{%f%k%}|%{%F{white}%K{red}%}%a%{%f%k%}]'

prompt_bar_left_user='$c_user'
prompt_bar_left_host='$c_host%m:$c_user'
prompt_bar_left_branch='`current_branch`'
prompt_bar_left_status="%{%B%(?.%K{blue}%F{white}.%K{red}%F{white})%} %? %{%f%b%}"
prompt_bar_left_date='<%{%B%}%D{%H:%M}%{%b%}>'
# prompt_bar_left_path="%{%B%F{red}%}%d%{%f%k%b%}"
prompt_bar_left_path="%{%B%F{yellow}%} %3~ %{%f%k%b%}"
prompt_bar_left_deco='%{%B%F{magenta}%}'
prompt_bar_left="${prompt_bar_left_status}${prompt_bar_left_branch} ${prompt_bar_left_host}${prompt_bar_left_path}${prompt_bar_left_deco}"
prompt_left='%{%B%F{magenta}%}$role->%{%f%b%}'

count_prompt_characters()
{
  print -n -P -- "$1" | sed -e $'s/\e\[[0-9;]*m//g' | wc -m | sed -e 's/ //g'
}

update_prompt()
{
  local bar_left_length=$(count_prompt_characters "$prompt_bar_left")
  local bar_rest_length=$[COLUMNS - bar_left_length]
  local bar_left="$prompt_bar_left"
  local bar_right_without_path="${prompt_bar_right:s/%d//}"
  local bar_right_without_path_length=$(count_prompt_characters "$bar_right_without_path")
  local max_path_length=$[bar_rest_length - bar_right_without_path_length]
  bar_right=${prompt_bar_right:s/%d/%(C,%${max_path_length}<...<%d%<<,)/}
  local separator="${(l:${bar_rest_length}::_:)}%{%k%f%b%}"
  bar_right="%${bar_rest_length}<<${separator}${bar_right}%<<"
  PROMPT="${bar_left}${bar_right}"$'\n'"${prompt_left}"
  RPROMPT="%{%K{blue}%}%{%F{white}%} %D{%Y/%m/%d %H:%M} %{%k%f%b%}"
  case "$TERM_PROGRAM" in
    Apple_Terminal)
      RPROMPT="${RPROMPT}-"
      ;;
  esac
}
precmd_functions=($precmd_functions update_prompt)
# }}}

# ls {{{
autoload -Uz VCS_INFO_get_data_git; VCS_INFO_get_data_git 2> /dev/null
autoload -U colors; colors
# }}}

# alias {{{
case $(uname) in
  *BSD|Darwin)
    if [ -x "$(which gnuls)" ]; then
      alias ls="gnuls"
      alias la="ls -hAF --color=auto"
    else
      alias la="ls -hAFG"
    fi
    alias ps="ps -fU$(whoami)"
    ;;
  SunOS)
    if [ -x "`which gls`" ]; then
      alias ls="gls"
      alias la="ls -hAF --color=auto"
    else
      alias la="ls -hAF"
    fi
    alias ps="ps -fl -u$(/usr/xpg4/bin/id -un)"
    ;;
  *)
    alias la="ls -hAF --color=auto"
    alias ps="ps -fU$(whoami) --forest"
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

cd-gitroot()
{
  result=`git rev-parse --is-inside-work-tree`
  if [ $result == 'true' ]; then
    cd `git rev-parse --show-toplevel`
  else
    return
  fi
}

alias cdu='cd-gitroot'

# tmux
alias aliastx='alias | grep tmux'
alias tmls='\tmux list-sessions'
alias tmlc='\tmux list-clients'
alias killtmux='\tmux kill-server'
alias tmkl='\tmux kill-session'
alias tmaw='\tmux main-horizontal'
alias tmuxa='\tmux -2 a -t'
# tmux起動中にtmuxコマンドが使用できるように
if [ "$SHLVL" -eq 1 ]; then
  alias tmx='tmux -2 new-session'
fi

# platuml
alias uml="java -jar ${HOME}/local/bin/plantuml.jar -tpng"

# z
alias j='z'

# cd-gitroot
# alias cdu='cd-gitroot'

# gisty
# alias gisty='gisty post'

# vim
: alias mvim='mvim -g'
alias cvim='/usr/local/bin/vim'

# rails
alias b='bundle'
alias be='bundle exec'
alias br='bin/rails'
alias railss='rails s -b 0.0.0.0'
alias -g E='exec'
alias -g I='install'

alias :q='exit'

alias -g JSON='| python -m json.tool > __TMP_JSON_FILE__.json'
alias -g G='| grep -v grep | grep'
alias -g L='| less'
alias -g C='| color'
alias -g V='| vim -R -'
alias -g H=' --help'

alias -g pcd='cd !:*'

# ag
alias ag="ag --pager=\"less -R\""

alias gyazo="gyazo-cli"

alias honyaku='google 翻訳'

# }}}

# history {{{
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_ignore_space
setopt extended_history
LISTMAX=1000
WORDCHARS="$WORDCHARS|:"
# }}}

# function - _set_tmux_window ------------------------------------------ {{{
# @detail TMUXのwindowを環境変数に出力します
_set_tmux_window() {
  if [ "$TMUX" ]; then
    # tmux display
    #   -p 標準出力へ
    #   #I ウィンドウ番号
    #   #P ペイン番号
    export TMUX_WINDOW=$(tmux display -p '#I-#P')
  fi
}
# }}}

# function - prompt-git-current-branch --------------------------------- {{{
# @detail 現在のプロジェクトのbranchを取得します
current_branch() {
  if [[ "$PWD" = ${DOTFILES}'/\.git(/.*)?$' ]]; then
    echo "%{%B${fg[black]}%}no git%{${reset_color}%}%b"
    return
  fi
  name=$(basename "`git symbolic-ref HEAD 2> /dev/null`")
  if [[ -z $name ]]; then
    echo "%{%B${fg[black]}%} branch %{${reset_color}%}%b"
    return
  fi
  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    color=${bg[blue]}${fg[green]}
  elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
    color=${bg[red]}${fg[blue]}
  elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
    color=${bg[red]}${fg_bold[white]}
  else
    color=${bg[red]}${fg_bold[white]}
  fi
  # %{...%} は囲まれた文字列がエスケープシーケンスであることを明示する
  # これをしないと右プロンプトの位置がずれる
  echo "%{$color%}%{%B%} $name %{%b%}%{$reset_color%}"
}
# }}}

# ----------------------------------------------------------------------
# event - chpwd
# @detail cd 後に実行するイベントです
chpwd() { ls_abbrev }

# 時刻更新
TRAPALRM () { zle reset-prompt }
TMOUT=60

# See: http://qiita.com/fmy/items/b92254d14049996f6ec3
agvim () {
  \vim $(ag $@ | peco --query "$LBUFFER" | awk -F : '{print "-c " $2 " " $1}')
}

# docker-inspect -------------------------------------------------------{{{
docker-inspect() {
  local res
  res=$(docker inspect `docker images | awk 'NR>1 {print}' | peco | awk '{print $3}'`)
  echo $res
}
zle -N docker-inspect
bindkey '^w' docker-inspect
#   }}}

# select_vim -------------------------------------------------------------- {{{
# gui と cui の vim を選択します
# 引数なしで実行するとトグルになります

export MY_VIM_TYPE='gui'  # デフォルト値

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
    export MY_VIM_TYPE='gui'
    vim_type
    return
  fi
  if [[ $1 == 'cui' ]]; then
    alias vim='/usr/local/bin/vim'
    export MY_VIM_TYPE='cui'
    vim_type
    return
  fi
  if [[ $1 == 'neo' ]]; then
    alias vim='/usr/local/bin/nvim'
    export MY_VIM_TYPE='neo'
    vim_type
    return
  fi
}
_select_vim_complete () {
  compadd gui cui neo
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
# }}}

# select_tmux_window -------------------------------------------------------{{{
select_tmux_window() {
  which tmux peco > /dev/null
  if [ $? -ne 0 ]; then
    echo "Please install peco and tmux"
    return 1
  fi
  local res
  res=$(\tmux list-windows | peco | cut -c 1)
  if [[ $res != '' ]]; then
    tmux move-window -s $res
  fi
}
zle -N select_tmux_window
bindkey '^w' select_tmux_window
#   }}}

# ls_abbrev --------------------------------------------------------------- {{{
# event - ls_abbrev
# @detail 現在のosに搭載されている ls を実行します
ls_abbrev() {
  local cmd_ls='ls'
  local -a opt_ls
  opt_ls=('-CF' '--color=always')
  case "${OSTYPE}" in
    freebsd*|darwin*)
      if type gls > /dev/null 2>&1; then
        cmd_ls='gls'
      else
        opt_ls=('-CFG')
      fi
      ;;
  esac

  local ls_result
  ls_result=$(CLICOLOR_FORCE=1 COLUMNS=$COLUMNS command $cmd_ls ${opt_ls[@]} | sed $'/^\e\[[0-9;]*m$/d')

  local ls_lines=$(echo "$ls_result" | wc -l | tr -d ' ')

  if [ $ls_lines -gt  6 ]; then
    echo "$ls_result" | head -n 3
    echo '...'
    echo "$ls_result" | tail -n 3
    echo "$(command ls -1 -A | wc -l | tr -d ' ') files exist"
  else
    echo "$ls_result"
  fi
}
# }}}

# quick git status -------------------------------------------------------- {{{
# event - ls_abbrev
# @detail 現在のosに搭載されている ls を実行します
git_status() {
  which git > /dev/null
  if [ $? -ne 0 ]; then
    echo "Plese install peco and git"
    return 1
  fi
  if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = 'true' ]; then
    BUFFER='git status -s'
    zle accept-line
  else
    return 1
  fi
}
zle -N git_status
bindkey '^j^s' git_status
# }}}

# peco branch list -------------------------------------------------------- {{{
# event - ls_abbrev
# @detail 現在のosに搭載されている ls を実行します
peco-git-recent-branches()
{
  which git peco > /dev/null
  if [ $? -ne 0 ]; then
    echo "Plese install peco and git"
    return 1
  fi
  if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = 'true' ]; then
    local selected_branch=$( git for-each-ref --format='%(refname)' --sort=-committerdate  refs/heads | ruby -pne '$_.gsub!(/refs\/(heads|remotes)\//, "")' | peco )
    if [ -n "$selected_branch" ]; then
      BUFFER="git checkout $selected_branch"
      zle accept-line
    fi
  else
    return 1
  fi
}

zle -N peco-git-recent-branches
bindkey '^j^b' peco-git-recent-branches
# }}}

# peco tmux session list --------------------------------------------------- {{{
# event - ls_abbrev
peco-tmux-session()
{
  which tmux peco > /dev/null
  if [ $? -ne 0 ]; then
    echo "Please install peco and tmux"
    return 1
  fi
  local res
  res=$(\tmux list-sessions | peco | awk -F':' '{print $1}')
  if [ -n "$res" ]; then
    if [ -n "$TMUX" ]; then
      BUFFER="tmux switch-client -t $res"
    else
      BUFFER="tmux attach -t $res"
    fi
    zle accept-line
  fi
}
zle -N peco-tmux-session
bindkey '^s' peco-tmux-session
# }}}

# peco ls cd -------------------------------------------------------------- {{{
# function - peco-lscd
# See: http://qiita.com/xtetsuji/items/05f6f4c1b17854cdd75b
peco-lscd()
{
  which peco > /dev/null
  if [ $? -ne 0 ]; then
    echo "Please install peco"
    return 1
  fi
  local dir="$( find . -maxdepth 1 -type d | sed -e 's;\./;;' | peco )"
  if [ ! -z "$dir" ] ; then
    cd "$dir"
  fi
}
zle -N peco-lscd
alias lscd='peco-lscd'
# }}}

# peco-file-name search -------------------------------------------------- {{{
# See:https://github.com/ryoppy/cool-peco/blob/master/functions/cool-peco-filename-search
peco-file-name-search()
{
  which peco > /dev/null
  if [ $? -ne 0 ]; then
    echo "Please install peco"
    return 1
  fi
  local res=$(z | sort -rn | cut -c 12- | peco)
  if [ -n "$res" ]; then
    BUFFER+="cd $res"
    zle accept-line
  else
    return 1
  fi
}
zle -N peco-file-name-search
bindkey '^f' peco-file-name-search
# }}}

# peco-select-history ---------------------------------------------------- {{{
peco-select-history()
{
  local tac
  if which tac > /dev/null; then
    tac="tac"
  else
    tac="tail -r"
  fi
  BUFFER=$(\history -n 1 | \
    eval $tac | \
    fzf --reverse --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history
# }}}

# peco-src ---------------------------------------------------------------- {{{
peco-src () {
local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
if [ -n "$selected_dir" ]; then
  BUFFER="cd ${selected_dir}"
  zle accept-line
fi
zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src
# }}}

# constants {{{
gn=${fg[green]}
yw=${fg[yellow]}
be=${fg[blue]}
cn=${fg[cyan]}
ma=${fg[magenta]}
rd=${fg[red]}
gy=${fg[gray]}
rc=$reset_color

colors=(
## 気に入らない色はコメントアウト
# $'%{\e[0;30m%}' # black
$'%{\e[0;31m%}' # red
$'%{\e[0;32m%}' # green
$'%{\e[0;33m%}' # brown
$'%{\e[0;34m%}' # blue
$'%{\e[0;35m%}' # purple
$'%{\e[0;36m%}' # cyan
# $'%{\e[0;37m%}' # gray

## light colors
# $'%{\e[1;30m%}' # black
$'%{\e[1;31m%}' # red
$'%{\e[1;32m%}' # green
$'%{\e[1;33m%}' # brown
$'%{\e[1;34m%}' # blue
$'%{\e[1;35m%}' # purple
$'%{\e[1;36m%}' # cyan
# $'%{\e[1;37m%}' # gray
)
c_user=$colors[$((`echo "$USER" | sum | cut -f1 -d' '`%${#colors}))+1]$USER
c_host=$colors[$((`echo "$HOST" | sum | cut -f1 -d' '`%${#colors}))+1]
c_ip=$colors[$((`echo "$IP" | sum | cut -f1 -d' '`%${#colors}))+1]($IP)
role='%(!.#.$)'
WORDCHARS='*?_-.[~=&;!#$%^({<>})]'
# }}}

export FZF_DEFAULT_COMMAND='
  (git ls-tree -r --name-only HEAD ||
       find . -path "*/\.*" -prune -o -type f -print -o -type l -print |
         sed s/^..//) 2> /dev/null'

# eval "$(direnv hook zsh)"

if [[ -s ~/.nvm/nvm.sh ]];
  then source ~/.nvm/nvm.sh
fi

# source ~/.npm_completion

# if (which zprof > /dev/null) ;then
#   zprof | less
# fi
ulimit -n 2048
