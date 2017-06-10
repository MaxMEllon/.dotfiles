#!/bin/bash

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
  wifi=`wifi | awk -F ' ' '{print $2 $3}'`
else
  wifi=''
fi

# battery ---------------------------------------------------------------------
which mybattery > /dev/null
if [ $? -eq 0 ]; then
  battery='Pow.#(mybattery)'
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
  ruby=`ruby -v | awk -F ' ' '{print $2}'`
else
  ruby=''
fi

# node-version ----------------------------------------------------------------
which node > /dev/null
if [ $? -eq 0 ]; then
  node='#(node -v)'
else
  node=''
fi

# ip --------------------------------------------------------------------------
ip="#(~/local/bin/ip | awk '{print $2}')"

# weather ---------------------------------------------------------------------
which weather_emojify > /dev/null
if [ $? -ne 0 ]; then
  weather=''
else
  weather=`weather_emojify`
fi

which tmux > /dev/null
if [ $? -eq 0 ]; then
  tmux set-option -g status-right "$basecolor $s1 $battery $s2 $s4 $node $s5 $wifi "
fi

# vim:ft=sh
