rbenv-alias-gen()
{
  for v in $(rbenv versions | tr '*' ' ' | sed -e 's/(.*//g' | grep -E '[0-9]\.[0-9]\.[0-9]$'); do
    alias "ruby-${v}=RBENV_VERSION=${v} ruby"
  done
}

rbenv-alias-gen
