myssh()
{
  ssh $(cat ~/.ssh/known_hosts | awk '{print $1}' | awk -F ',' '{print $1}' | fzf-tmux)
}
