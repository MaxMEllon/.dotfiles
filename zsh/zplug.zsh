source ~/.zplug/init.zsh

zplug 'hchbaw/auto-fu.zsh', \
    at:next

zplug 'zplug/zplug'

zplug 'b4b4r07/zspec', \
    as:command, \
    use:bin, \
    lazy:true

zplug 'mrowa44/emojify', \
    as:command, \
    lazy:true

zplug 'rupa/z', \
    use:z.sh

zplug 'supercrabtree/k'

zplug 'junegunn/fzf-bin', \
    as:command, \
    from:gh-r, \
    rename-to:fzf, \
    use:"*darwin*amd64*"

zplug 'b4b4r07/enhancd', \
    use:init.sh

zplug 'zsh-users/zsh-autosuggestions'

zplug 'zsh-users/zsh-completions'

zplug 'zsh-users/zsh-syntax-highlighting', \
    nice:19

zplug load

if ! zplug check; then
  zplug install
fi

if zplug check zsh-users/zsh-syntax-highlighting; then
  export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
  export ZSH_HIGHLIGHT_STYLES[path]='fg=cyan'
  export ZSH_HIGHLIGHT_STYLES[bracket-error]='fg=red,bold'
  export ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=blue,bold'
  export ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=green,bold'
  export ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=magenta,bold'
  export ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=yellow,bold'
  export ZSH_HIGHLIGHT_STYLES[bracket-level-5]='fg=cyan,bold'
  export ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]='standout'
fi

if zplug check b4b4r07/enhancd; then
  export ENHANCD_FILTER="fzf-tmux:fzf"
fi

if zplug check supercrabtree/k; then
  alias ll='k --no-vcs'
  alias lla='k -a --no-vcs'
fi

if zplug check hchbaw/auto-fu.zsh; then
  function zle-line-init() { auto-fu-init }
  zle -N zle-line-init
  zstyle ':auto-fu:var' postdisplay $''
fi

