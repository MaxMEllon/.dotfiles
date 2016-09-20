has ghq && has fzf || return 0;

ghq-quick-move()
{
  local res=$(ghq list -p | fzf)
  if [ -n "$res" ]; then
    BUFFER="cd $res"
    zle accept-line
  else
    return 1
  fi
}

zle -N ghq-quick-move
