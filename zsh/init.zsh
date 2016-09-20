logo='
                               _ _
                              | | |
 ____   ____ _   _ ____   ____| | | ___  ____
|    \\ / _  ( \\ / )    \\ / _  ) | |/ _ \\|  _ \\
| | | ( ( | |) X (| | | ( (/ /| | | |_| | | | |
|_|_|_|\\_||_(_/ \\_)_|_|_|\\____)_|_|\\___/|_| |_|

'

printf $logo

autoload -U compinit
compinit

bindkey -e

my-load zsh/zplug.zsh
my-load zsh/opt.zsh
my-load zsh/style.zsh
my-load lib/conveni.sh
my-load zsh/alias.zsh
my-load zsh/prompt.zsh
my-load zsh/history.zsh

for file in $DOTPATH/zsh/functions/*.zsh; do
  source $file
done

my-load zsh/bind.zsh

ulimit -n 2048
