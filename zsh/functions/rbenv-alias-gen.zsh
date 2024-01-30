rbenv-alias-gen()
{
  if has rbenv; then
    for v in $(rbenv versions | tr '*' ' ' | sed -e 's/(.*//g' | grep -E '[0-9]\.[0-9]\.[0-9]$'); do
      alias "ruby-${v}=RBENV_VERSION=${v} ruby"
    done
  fi
}

rbenv-alias-gen
