#!/bin/zsh
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


#export NVD_BACKEND=direct

# Completion
autoload -U compinit
compinit
# doas completion
source /usr/share/fzf/key-bindings.zsh
# add git completion to `dotfiles`
compdef _git dotfiles=git

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
setopt hist_ignore_all_dups
# don't record commands starting with space (e.g. "_cat /etc/...")
setopt hist_ignore_space

# Plugins
# https://github.com/jeffreytse/zsh-vi-mode
source $HOME/.zsh/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# POWERLEVEL10K
# https://github.com/romkatv/powerlevel10k
source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh





# Source at the end
# https://github.com/zsh-users/zsh-syntax-highlighting
source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
