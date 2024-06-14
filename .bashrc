# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


# Put your fun stuff here.

# doas bash completion
complete -cf doas
# git bash completion
source /usr/share/bash-completion/completions/git
# fzf bash completion
source /usr/share/bash-completion/completions/fzf
source /usr/share/fzf/key-bindings.bash


# ALIASES
alias nano="nvim"
alias vim="nvim"

alias lockscreen='i3lock -i /home/neo/Desktop/Images/lockscreen.png'

alias journal='cd ~/digital-journal && nvim README.md'
alias jrnl='cd ~/digital-journal && nvim README.md'


# git status in prompt
source /usr/share/git/git-prompt.sh
export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;33m\]$(__git_ps1)\[\033[01;34m\] \$\[\033[00m\] 󰣨 '
export GIT_PS1_SHOWDIRTYSTATE=1
export PATH=/home/neo/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/opt/bin:/usr/lib/llvm/17/bin
