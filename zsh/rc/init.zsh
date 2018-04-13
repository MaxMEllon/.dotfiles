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
compinit -C

[[ is_osx ]] && PROMPT_SOURCE='zsh/rc/prompt.mac.zsh' \
             || PROMPT_SOURCE='zsh/rc/prompt.zsh'

myplug zsh/rc/zplug.zsh
myplug zsh/rc/opt.zsh
myplug zsh/rc/style.zsh
myplug $PROMPT_SOURCE
# myplug zsh/rc/hook.zsh
myplug zsh/rc/history.zsh
myplug zsh/rc/misc.zsh
myplug zsh/rc/alias.zsh

for file in $DOTPATH/zsh/functions/*.zsh; do
  source $file
done

myplug zsh/rc/bind.zsh

remove_duplicated_path
