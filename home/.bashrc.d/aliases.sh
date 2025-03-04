#!/bin/bash

# check whether binary is available before making an alias
create_valid_alias() {
    local cmd="$1"
    local alias_name="$2"
    local alias_cmd="$3"

    if command -v "$cmd" &> /dev/null; then
        alias "$alias_name"="$alias_cmd"
    fi
}

# vim mindset
alias ":q"="exit"

# check if eza is available
if command -v eza &> /dev/null; then
    alias ls="eza --icons --sort=age --group-directories-first"
else
    alias ls="ls --color --indicator-style=slash --group-directories-first"
fi

create_valid_alias "bat" "cat" "bat"
create_valid_alias "nvim" "nano" "nvim"
create_valid_alias "nvim" "vim" "nvim"
create_valid_alias "i3lock" "lockscreen" "i3lock -i \$HOME/Desktop/Images/lockscreen.png"

# journal
alias jrnl="cd $HOME/digital-journal && nvim README.md"

# for dotfiles
#alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
