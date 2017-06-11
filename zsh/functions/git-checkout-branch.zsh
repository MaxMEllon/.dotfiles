has fzf-tmux || \
  {
    alias gco='git chekout'
    return 0
  }

  git-checkout-branch()
  {
    if (( $# == 0 )); then
      local selected_branch=$(git branch | fzf-tmux | tr -d ' ' | tr -d '*')
      git checkout $selected_branch
    else
      if [[ $1 == "-b" ]]; then
        git checkout $1 $2
      else
        git checkout $1
      fi
    fi
  }

  alias gco='git-checkout-branch'
