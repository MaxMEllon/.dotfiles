function peco-find-file() {
  if git rev-parse 2> /dev/null; then
    source_files=$(git ls-files)
  else
    source_files=$(find . -type f)
  fi
  selected_files=$(echo $source_files | fzf)
  BUFFER="${BUFFER}${echo $selected_files | tr '\n' ' '}"
  zle accept-line
}
zle -N peco-find-file
