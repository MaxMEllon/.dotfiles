has fzf-tmux || return 0

git-checkout-branch()
{
  local selected_branch=$(git branch | fzf-tmux | tr -d ' ' | tr -d '*')

  git checkout $selected_branch
}

alias gco='git-checkout-branch'
