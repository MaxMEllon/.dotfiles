has tree || return 0

ignorefile_path=""
result=`git rev-parse --is-inside-work-tree` 2>/dev/null
if [[ $result == 'true' ]]; then
  ignorefile_path=`git rev-parse --show-toplevel`
else
  return
fi
tree-vim() {
  local SELECTED_FILE
  if [ -r "$ignorefile_path/.gitignore" ]; then
    local ignores="$(cat $ignorefile_path/.gitignore | tr '\n' '|' | sed '$s/.$//')"
    SELECTED_FILE=$(tree --charset=utf8 -f -I $ignores -L 2 \
                    | fzf-tmux --no-sort -l 30 \
                    | sed -e s/─//g | sed -e s/├//g | sed -e s/└//g \
                    | xargs echo)
  else
    SELECTED_FILE=$(tree --charset=utf8 -f -L 2 \
                    | fzf-tmux --no-sort -l 30 \
                    | sed -e s/─//g | sed -e s/├//g | sed -e s/└//g \
                    | xargs echo)
  fi
  echo $SELECTED_FILE
  eval "vim $SELECTED_FILE"
}

alias treevim='tree-vim'
