has fzf-tmux || return 0
has jq || return 0

npm-run-scripts-selector()
{
  [ -s package.json ] || return 0
  command=$(cat package.json | jq ".scripts | keys | .[]" | tr -d '"' | fzf-tmux)
  if has yarn; then
    eval "yarn run $command"
  else
    eval "npm run $command"
  fi
}

alias nrs="npm-run-scripts-selector"
