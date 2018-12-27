has z && has fzf || return 0

z-quick-move()
{
  local res=$(z | sort -rn | cut -c 12- | fzy)
  if [ -n "$res" ]; then
    BUFFER="cd $res"
    zle accept-line
  else
    return 1
  fi
}
zle -N z-quick-move
