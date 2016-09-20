psf()
{
  if is_osx; then
    local res=$(ps -fU$USER | fzf | awk '{print $2}')
    print $res
  else
    ps aux | fzf
  fi
}

zle -N psf
