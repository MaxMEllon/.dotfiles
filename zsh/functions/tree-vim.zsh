has tree || return 0

tree-vim() {
  local ignorefile_path=""
  result=`git rev-parse --is-inside-work-tree` 2>/dev/null
  if [[ $result == 'true' ]]; then
    ignorefile_path=`git rev-parse --show-toplevel`
  else
    return
  fi

  local SELECTED_FILE
  if [ -r "$ignorefile_path/.gitignore" ]; then
    local ignores="$(cat $ignorefile_path/.gitignore | tr '\n' '|' | sed '$s/.$//')"
    SELECTED_FILE=$(tree --charset=ascii -f -I $ignores -L 2 \
                    | fzf-tmux --no-sort -l 30 \
                    | sed -e s/\|//g | sed -e s/-//g \
                    | sed -e s/\`//g | xargs echo)
  else
    SELECTED_FILE=$(tree --charset=ascii -f -L 2 \
                    | fzf-tmux --no-sort -l 30 \
                    | sed -e s/\|//g | sed -e s/-//g \
                    | sed -e s/\`//g | xargs echo)
  fi
  echo $SELECTED_FILE
  if [[ $SELECTED_FILE != "" ]]; then
    eval "vim $SELECTED_FILE"
  else
    echo "✗ EMPTY"
  fi
}

alias treevim='tree-vim'
alias tv='tree-vim'
