################################################
### This is the ZSH powerless main script.
################################################

# Set options and settings.
setopt PROMPT_SUBST
setopt PROMPT_SP
ZLE_RPROMPT_INDENT=0

# Specify colors.
powerless_color_text="black"
powerless_color_user_host="172"
powerless_color_code_ok="7"
powerless_color_code_wrong="red"
powerless_color_pwd="75"
powerless_color_git="114"

# Specify common variables.
prompt_char=''
arrow_character=''
dir_character=''
user_character=''
newline=''

get-os-emoji() {
  echo -n "%{%F{16}%K{85}%} "
  case $(uname) in
    'Darwin' )
      printf "MAC"
      ;;
    'Linux' )
      printf "LINUX"
      ;;
    * )
      printf "ETC"
      ;;
  esac
  echo -n " "
}

store-colors() {
  fg_color=$1 && bg_color=$2
}

get-arrow() {
  [[ $# -eq 2 ]] && echo -n "%F{$1}%K{$2}$arrow_character%f%k" || echo -n "%F{$1}$arrow_character%f"
}

get-user-host() {
  echo -n "%{%F{$1}%K{$2}%} $user_character %n@%M %{%f%k%}"
  store-colors $1 $2
}

get-pwd() {
  echo -n "$(get-arrow $bg_color $2)%F{$1}%K{$2}$dir_character %2~ %k$(get-arrow $powerless_color_git)%f%k"
  store-colors $1 $2
}

get-git-info() {
  git_branch=$(git rev-parse --abbrev-ref HEAD 2>&1)
  git_is=$?
  if (( ${#git_branch} >= 15 )); then
    git_branch=$(echo $git_branch | cut -c -15)
    git_branch="${git_branch}..."
  fi

  [[ "$git_is" == "0" ]] && echo -n "$(get-arrow $bg_color $2)%F{$1}%K{$2} $git_branch %k$(get-arrow $bg_color)%f%k"

  store-colors $1 $2
}

get-last-code() {
  [[ $last_code -eq 0 ]] && echo -n "✔ $last_code" || echo -n "%{%F{$3}%} ✘ $last_code %{%f%}"
}

get-prompt() {
  echo -n "$newline" && ([[ "$(print -P "%#")" == "#" ]] && echo -n "%{%F{$powerless_color_code_wrong}%}$prompt_char%{%f%} " || echo -n " $prompt_char ")
}

get-last-status() {
  echo -n "%F{0}%K{%(?.004.005)} $? "
}

powerless-prompt() {
  get-last-status
  get-os-emoji
  get-pwd $powerless_color_text $powerless_color_pwd
  get-git-info $powerless_color_text $powerless_color_git
  get-prompt
}

precmd-powerless() {
  last_code=$?
  if git rev-parse --show-toplevel &>/dev/null 2>&1; then
    diff="$(git diff --shortstat | awk '{print " +" $4 " -" $6}' | tr -d '\n')"
  else
    diff=""
  fi
  if [[ $is_first_prompt -eq 999 ]]; then
    printf '%*s\c' $(($(tput cols) - 5 - ${#diff} - ${#last_code})) ""
    printf "$diff "
    print -P "$(get-last-code $powerless_color_text $powerless_color_code_ok $powerless_color_code_wrong)"
  else
    is_first_prompt=999
  fi
}

# Attach the hook functions.
# precmd_functions+=(precmd-powerless)

# Set the prompts.
PROMPT='$(powerless-prompt)'
