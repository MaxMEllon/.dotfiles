has fzf || return 0

git-remove-branch()
{
  local branchs q k results
  while out=$(
    git branch | sed -e 's/\*//g' -e 's/\ //g' \
               | sed -e 's/master//g' -e 's/develop//g' \
               | sort \
               | fzf --ansi --multi --no-sort --reverse --query="$q" \
                     --print-query --expect=ctrl-d); do
    q=$(head -1 <<< "$out")
    k=$(head -2 <<< "$out" | tail -1)
    branchs=$(sed '1,2d' <<< "$out" | awk '{print $1}')
    branchs=("${(@f)$(printf $branchs)}")
    [ -z "$branchs" ] && continue
    if [ "$k" = ctrl-d ]; then
      for branch in $branchs; do
        git branch -D $branch &> /dev/null
        if [ $? -eq 0 ]; then
          results=($results $branch)
        fi
      done
      printf "\n\e[31m Deleted branchs:\e[0m\n"
      for result in $results; do
        printf "\t\e[32m $result\e[0m\n"
      done
      printf "\n"
      break
    fi
  done
}

alias grb='git-remove-branch'
