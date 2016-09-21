autoload -U colors; colors

myplug bash/aliases.bash

alias -g E='exec'
alias -g I='install'
alias -g JSON='| python -m json.tool > __TMP_JSON_FILE__.json'
alias -g G='| grep -v grep | grep'
alias -g L='| less'
alias -g C='| color'
alias -g V='| vim -R -'
alias -g H=' --help'
alias -g pcd='cd !:*'
alias -g GL='`git ls-files | FZF`'