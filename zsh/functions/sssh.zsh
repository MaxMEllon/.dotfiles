sssh() {
  host=$(cat ~/.ssh/known_hosts | awk -F ' ' '{print $1}' | awk -F ',' '{print $1}' | sed -e 's/\[//g' | fzf-tmux)
  BUFFER="ssh $host"
}

zle -N sssh
