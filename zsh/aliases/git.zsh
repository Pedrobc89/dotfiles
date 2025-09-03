alias gs='git status'

function git_current_branch() {
  git -C "$1" branch | sed  '/^\*/!d;s/\* //'
}
