git-ls-files-vim()
{
  git ls-files | vim -R +'setf dirvish' -
}

alias gv='git-ls-files-vim'
