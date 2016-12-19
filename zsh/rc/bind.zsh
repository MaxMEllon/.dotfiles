bindkey-advice-before()
{
  local key="$1"
  local advice="$2"
  local widget="$3"
  [[ -z "$widget" ]] && {
    local -a bind
    bind=(`bindkey -M main "$key"`)
    widget=$bind[2]
  }
  local fun="$advice"
  zle -N "$fun"
  bindkey -M afu "$key" "$fun"
}

binding()
{
  if has auto-fu-init; then
    bindkey-advice-before $1 $2
  else
    bindkey $1 $2
  fi
}

bindkey -e

binding "^g" afu+cancel
binding "^f" z-quick-move
binding "^]" ghq-quick-move
binding "^r" history-quick-search
binding "^s" emoji::cli
binding "^z" myfg

