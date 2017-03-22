source ~/.zplug/init.zsh

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

zplug 'b4b4r07/zspec', \
    as:command, \
    use:bin, \
    lazy:true

zplug 'b4b4r07/emoji-cli', \
    on:"junegunn/fzf-bin", \
    if:'(( $+commands[jq] ))'

zplug 'b4b4r07/copy', \
    as:command, \
    use:'(*).sh', \
    rename-to:'pecopy'

# zplug 'mrowa44/emojify', \
#     as:command, \
#     lazy:true

zplug 'knu/z', \
    use:z.sh, \
    defer:1

zplug 'supercrabtree/k'

zplug 'jhawthorn/fzy', \
    as:command, \
    rename-to:fzy, \
    hook-build:"
    {
        make
        sudo make install
    } &>/dev/null
    "

zplug 'junegunn/fzf-bin', \
    as:command, \
    from:gh-r, \
    rename-to:fzf, \
    use:"*darwin*amd64*"

zplug 'b4b4r07/git-conflict', \
    as:command \

zplug 'maxmellon/yarn_completion'
zplug 'maxmellon/circleci-cli_completion'

# zplug 'b4b4r07/enhancd', \
#     use:init.sh

zplug 'zsh-users/zsh-autosuggestions'

zplug 'zsh-users/zsh-completions'

# zplug "zsh-users/zsh-history-substring-search", \
#     defer:3

zplug 'zsh-users/zsh-syntax-highlighting', \
    defer:3

zplug 'paulirish/git-open', as:command

zplug load

if ! zplug check; then
  zplug install
fi

if zplug check zsh-users/zsh-syntax-highlighting; then
  ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
  ZSH_HIGHLIGHT_STYLES[default]=none
  ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=196,bold
  ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=045,bold
  ZSH_HIGHLIGHT_STYLES[alias]=fg=159,bold
  ZSH_HIGHLIGHT_STYLES[builtin]=fg=082,bold
  ZSH_HIGHLIGHT_STYLES[function]=fg=013,bold
  ZSH_HIGHLIGHT_STYLES[command]=fg=082,bold
  ZSH_HIGHLIGHT_STYLES[precommand]=fg=082,underline
  ZSH_HIGHLIGHT_STYLES[commandseparator]=none
  ZSH_HIGHLIGHT_STYLES[hashed-command]=fg=039
  ZSH_HIGHLIGHT_STYLES[comment]=fg=039
  ZSH_HIGHLIGHT_STYLES[path]=fg=014,underline
  ZSH_HIGHLIGHT_STYLES[globbing]=fg=033
  ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=white,underline
  ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=125,bold
  ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=125,bold
  ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
  ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=136
  ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=136
  ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=136
  ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=136
  ZSH_HIGHLIGHT_STYLES[assign]=fg=037
  ZSH_HIGHLIGHT_STYLES[bracket-error]=fg=red,bold
  ZSH_HIGHLIGHT_STYLES[bracket-level-1]=fg=blue,bold
  ZSH_HIGHLIGHT_STYLES[bracket-level-2]=fg=green,bold
  ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=magenta,bold
  ZSH_HIGHLIGHT_STYLES[bracket-level-4]=fg=yellow,bold
  ZSH_HIGHLIGHT_STYLES[bracket-level-5]=fg=cyan,bold
  ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]=standout
fi

if zplug check b4b4r07/enhancd; then
  export ENHANCD_FILTER="fzy:fzf-tmux:fzf"
fi

if zplug check supercrabtree/k; then
  alias ll='k --no-vcs'
  alias lla='k -a --no-vcs'
fi

if zplug check hchbaw/auto-fu.zsh; then
  if has auto-fu-init; then
    auto-fu-install
    function zle-line-init() { auto-fu-init }
    zle -N zle-line-init
    zstyle ':auto-fu:var' postdisplay $''
  fi
fi
