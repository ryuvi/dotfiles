#!/bin/bash

alias del="rm -rf"
alias update="source $HOME/.zshrc"
alias upgrade="doas pacman -Syyuu --noconfirm"
alias inst="doas pacman -S --noconfirm"
alias remove="doas pacman -R --noconfirm"
alias addignore='f() { echo "$@" >> .gitignore; unset -f f}; f'
alias c='cd'
alias py='python3'
alias pi='pip3'
alias cl='clear && ls'
alias connect_wifi='nmtui'

if [[ $(which nvim) == *"not found"* ]]; then
	alias v='vim'

else
	alias v='nvim'

fi

alias setkey='setxkbmap -model abnt2 -layout br -variant abnt2 -option deadkeys'
