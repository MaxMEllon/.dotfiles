#!/bin/sh


sepchar='⮀'

header="#[fg=colour8,bold]#[bg=colour117]"
s1="#[fg=colour117]#[bg=colour30]${sepchar}#[fg=colour225]#[bg=colour30]"
s2="#[fg=colour30]#[bg=colour18]${sepchar}#[fg=colour255]#[bg=colour18]"
footer="#[fg=colour18]#[bg=default]${sepchar}"

sessionName='[#S]'
hostName='#H'
windowName='#W'

tmux set-option -g status-left "$header $hostName $s1 $sessionName $s2 $windowName $footer "

# vim:ft=sh
