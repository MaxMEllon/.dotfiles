autoload -U add-zsh-hook 2>/dev/null || return

__timetrack_threshold=10

export __timetrack_threshold
export __timetrack_ignore_progs=(
  vim zsh tmux exec source git ssh
)

function __my_preexec_start_timetrack() {
  local command=$1
  export __timetrack_start=`date +%s`
  export __timetrack_command="$command"
}

function __my_preexec_end_timetrack() {
  local exec_time
  local command=$__timetrack_command
  local prog=$(echo $command | awk '{print $1}')
  local notify_method
  local message

  export __timetrack_end=`date +%s`

  if [ -z "$__timetrack_start" ] || [ -z "$__timetrack_threshold" ]; then
    return
  fi

  for ignore_prog in $(echo $__timetrack_ignore_progs); do
    [ "$prog" = "$ignore_prog" ] && return
  done

  exec_time=$((__timetrack_end-__timetrack_start))
  if [ -z "$command" ]; then
    command="<UNKNOWN>"
  fi

  if [ "$exec_time" -ge "$__timetrack_threshold" ]; then
    (~/Applications/Notificator.app/Contents/Resources/Scripts/notificator --title 'コマンドの実行が完了しました' --subtitle '😋' --message "${command}sec" --sound 'Frog' &)

  fi

  unset __timetrack_start
  unset __timetrack_command
}

if is_osx; then
  add-zsh-hook preexec __my_preexec_start_timetrack
  add-zsh-hook precmd __my_preexec_end_timetrack
fi
