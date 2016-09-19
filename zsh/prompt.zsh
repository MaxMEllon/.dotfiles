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
c_host=$colors[$((`echo "$HOST" | sum | cut -f1 -d' '`%${#colors}))+1]$HOST

prompt_bar_left_user='$c_user'
prompt_bar_left_host='$c_host:$c_user'
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

current_branch()
{
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
