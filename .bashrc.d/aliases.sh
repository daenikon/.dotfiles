#!/bin/bash

alias ":q"="exit"

#alias ls="ls --color --indicator-style=slash --group-directories-first"
alias ls="eza --icons --sort=age --group-directories-first"
alias cat="bat"

alias nano="nvim"
alias vim="nvim"

alias lockscreen="i3lock -i $HOME/Desktop/Images/lockscreen.png"

alias journal="cd $HOME/digital-journal && nvim README.md"
alias jrnl="journal"

# for dotfiles
alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
