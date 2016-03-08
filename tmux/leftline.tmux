#!/bin/sh

BaseColor='#[fg=colour0,bold]#[bg=colour50]'
SessionName='[#[fg=colour8,bold]#S#[fg=colour0]]'

tmux set-option -g status-left "$BaseColor $SessionName #[fg=colour50]#[bg=default]⮀ "

# vim:ft=tmux
