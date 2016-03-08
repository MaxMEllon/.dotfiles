#!/bin/sh

# basecolor
basecolor='#[fg=colour50,bold]#[fg=colour235,bold] '

# separator ------------------------------------------------------------------
sepchar='⮂'
s1="#[fg=colour117]${sepchar}#[fg=colour0]#[bg=colour117]"
s2="#[fg=colour30]${sepchar}#[fg=colour225]#[bg=colour30]"
s3="#[fg=colour26]${sepchar}#[fg=colour255]#[bg=colour26]"
s4="#[fg=colour83]${sepchar}#[fg=colour0]#[bg=colour83]"
s5="#[fg=colour202]${sepchar}#[fg=colour255]#[bg=colour202]"

# wifi ------------------------------------------------------------------------
which wifi > /dev/null
if [ $? -eq 0 ]; then
  wifi='#(wifi)'
else
  wifi=''
fi

# battery ---------------------------------------------------------------------
which battery > /dev/null
if [ $? -eq 0 ]; then
  battery='Pow.#(battery)'
else
  battery=''
fi

# tmux-version ----------------------------------------------------------------
which tmux > /dev/null
if [ $? -eq 0 ]; then
  tmux='#(tmux -V)'
else
  tmux=''
fi

# zsh-version -----------------------------------------------------------------
which zsh > /dev/null
if [ $? -eq 0 ]; then
  zsh='#(zsh --version | less | cut -c-9)'
else
  zsh=''
fi

# ruby-version ----------------------------------------------------------------
which ruby > /dev/null
if [ $? -eq 0 ]; then
  ruby='#(ruby -v | less | cut -c-10 )'
else
  ruby=''
fi

which tmux > /dev/null
if [ $? -eq 0 ]; then
  tmux set-option -g status-right "$basecolor $s5 $wifi $s4 $battery $s3 $tmux $s2 $zsh $s1 $ruby "
fi

# vim:ft=sh
