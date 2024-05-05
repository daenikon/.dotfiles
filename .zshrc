#!/bin/zsh

# Completion
autoload -U compinit
compinit

# Gentoo Prompt
source "$HOME/.zsh/dk_prompt"
# Aliases
source "$HOME/.zsh/dk_aliases"




# Enable cache for the completions
zstyle ':completion::complete:*' use-cache 1
# Command correction
setopt correctall
# cd /etc --> /etc
setopt autocd

# HISTORY
HISTSIZE=2000
HISTFILE="$HOME/.history"
SAVEHIST=$HISTSIZE
# don't record duplicates in history
#setopt hist_ignore_all_dups
# don't record commands starting with space (e.g. "_cat /etc/...")
#setopt hist_ignore_space



# doas bash completion
source /usr/share/fzf/key-bindings.zsh


compdef _git dotfiles=git


