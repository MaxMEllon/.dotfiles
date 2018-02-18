saku-task-selector()
{
  [[ ! -f saku.md ]] && return || true
  local result=$(cat saku.md | grep -E '^#' | cut 3- | fzy)
  if [ -n "$result" ]; then
    eval "saku $result"
  else
    return 1
  fi
}

alias saki="saku-tasuk-selector"
