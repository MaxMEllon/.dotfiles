npm-remove-interactive()
{
  local k results
  while out=$(
    cat package.json \
          | jq '.devDependencies * .dependencies | keys[]' \
          | fzf --ansi --multi --no-sort --reverse --query="$q" \
                --print-query --expect=ctrl-d); do
    q=$(head -1 <<< "$out")
    k=$(head -2 <<< "$out" | tail -1)
    out=("${(@f)$(printf $out)}")
    [ -z "$out" ] && continue
    if [ "$k" = ctrl-d ]; then
      for p in $out; do
        npm remove $p
      done
      break
    fi
  done
}
