source ~/.zinit/bin/zinit.zsh

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# zplug 'hchbaw/auto-fu.zsh', \
#     at:next, \
#     use:auto-fu, \
#     if:"is_osx", \
#     hook-build:'
#       {
#         A=$ZPLUG_HOME/repos/hchbaw/auto-fu.zsh
#         zsh -c "source $A/auto-fu.zsh; auto-fu-zcompile $A/auto-fu.zsh $A"
#       } &>/dev/null
#     '

# zplug 'b4b4r07/zspec', \
#     as:command, \
#     use:bin, \
#     lazy:true

# zplug 'b4b4r07/emoji-cli', \
#     on:"junegunn/fzf-bin", \
#     if:'(( $+commands[jq] ))'

# zplug 'b4b4r07/copy', \
#     as:command, \
#     use:'(*).sh', \
#     rename-to:'pecopy'

# zplug 'maxmellon/slack-user-status-trigger', \
#     use:'(*.sh)', \
#     rename-to:'$1'

# zplug 'b4b4r07/history', \
#     as:command, \
#     from:gh-r, \
#     rename-to:history, \
#     use:"*darwin*amd64*"

# zplug 'mrowa44/emojify', \
#     as:command, \
#     lazy:true

zinit load agkozak/zsh-z

# zplug 'supercrabtree/k'

# zplug 'jhawthorn/fzy', \
#     as:command, \
#     rename-to:fzy, \
#     hook-build:"
#     {
#         make
#     } &>/dev/null
#     "

# if is_osx; then
#   zplug 'junegunn/fzf-bin', \
#       as:command, \
#       from:gh-r, \
#       rename-to:fzf, \
#       use:"*darwin*amd64*"
# elif is_linux; then
#   zplug 'junegunn/fzf-bin', \
#       as:command, \
#       from:gh-r, \
#       rename-to:fzf, \
#       use:"*linux*amd64*"
# fi

# zplug 'b4b4r07/git-conflict', \
#     as:command

# zplug 'maxmellon/yarn_completion'

# zplug 'maxmellon/circleci-cli_completion'

# zplug 'b4b4r07/enhancd', \
#     use:init.sh

zinit light zsh-users/zsh-autosuggestions

zinit light zsh-users/zsh-completions

# zplug "zsh-users/zsh-history-substring-search", \
#     defer:3

zinit light zdharma/fast-syntax-highlighting

# zplug 'paulirish/git-open', as:command

[ ! -d $HOME/.zdata ] && mkdir ~/.zdata
export _Z_DATA=$HOME/.zdata/.z
