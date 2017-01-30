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

myplug zsh/rc/zplug.zsh
myplug zsh/rc/opt.zsh
myplug zsh/rc/style.zsh
# myplug zsh/rc/prompt.mac.zsh
myplug zsh/rc/prompt.zsh
myplug zsh/rc/history.zsh
myplug zsh/rc/misc.zsh

for file in $DOTPATH/zsh/functions/*.zsh; do
  source $file
done

myplug zsh/rc/bind.zsh
myplug zsh/rc/alias.zsh

