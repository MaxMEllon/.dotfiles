has fzf-tmux || return 0
has jq || return 0

npm-run-scripts-selector()
{
  [ -s package.json ] || return 0
  command=$(cat package.json | jq ".scripts | keys | .[]" | tr -d '"' | fzf-tmux)
  eval "npm run $command"
}

alias nrs="npm-run-scripts-selector"
