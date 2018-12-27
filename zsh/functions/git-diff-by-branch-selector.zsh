# @args: $branch -- target branch name when show diff
# @depended: [git, peco, vimdiff]
git-diff-by-branch-peco-selector() {
  git config --local diff.tool vimdiff
  git config --local difftool.prompt false
  branch=$1
  file="$(git diff $branch --name-only | sort | peco)"
  git difftool $branch -- $file
}
