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

# bindkey-advice-before "^g" afu+cancel
bindkey-advice-before "^f" z-quick-move
bindkey-advice-before "^]" ghq-quick-move
bindkey-advice-before "^r" history-quick-search

