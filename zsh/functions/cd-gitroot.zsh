cd-gitroot()
{
  result=`git rev-parse --is-inside-work-tree`
  if [ $result == 'true' ]; then
    cd `git rev-parse --show-toplevel`
  else
    return
  fi
}

alias cdu='cd-gitroot'
