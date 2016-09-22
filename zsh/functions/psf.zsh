psf()
{
  if is_osx; then
    local res=$(ps -fU$USER | fzf | awk '{print $2}')
    print $res
  else
    local res=$(ps aux | fzf | awk '{print $2}')
    print $res
  fi
}

zle -N psf
