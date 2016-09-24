has opener || return 0

openrepo()
{
  is_repo=$(git rev-parse --is-inside-work-tree) 2> /dev/null
  if [[ $is_repo == 'true' ]]; then
    local res=$(git remote -v | grep origin | grep -v grep | awk 'NR==1 {print $2}')
    local url=$(printf $res | sed -e s/git\@//g | sed -e s@ssh\:\/\/@@g | sed -e s@\:@\/@g)
    printf "https://$url \n"
    opener "https://$url"
  else
    printf '✗ not git repository \n'
  fi
}

