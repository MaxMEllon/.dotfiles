function fzf-cd {
  local dir=$(eval 'echo "$(find . -maxdepth 1 -type d)\n.." | sort | fzf')
  if [ -n "$dir" ]; then
    cd "$dir"
  fi
}

alias cdd="fzf-cd"
