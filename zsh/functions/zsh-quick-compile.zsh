zsh-quick-compile() {
  for i in *.zsh; do
    zcompile $i
  done
}
