history-quick-search()
{
  local tac
  if has tac; then
    tac="tac"
  else
    tac="tail -r"
  fi
  BUFFER=$(\history -n 1 | \
    eval $tac | \
    fzy --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen 
}

zle -N history-quick-search
