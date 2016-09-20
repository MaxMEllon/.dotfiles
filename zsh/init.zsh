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

myplug zsh/zplug.zsh
myplug zsh/opt.zsh
myplug zsh/style.zsh
myplug lib/conveni.sh
myplug zsh/alias.zsh
myplug zsh/prompt.zsh
myplug zsh/history.zsh
myplug zsh/misc.zsh

for file in $DOTPATH/zsh/functions/*.zsh; do
  source $file
done

myplug zsh/bind.zsh

