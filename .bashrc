# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

# Put your fun stuff here.

# Source all scripts in ~/.bash
for file in ~/.bash/*.sh; do
    [ -r "$file" ] && . "$file"
done
unset file

# doas bash completion
complete -cf doas
# git bash completion
source /usr/share/bash-completion/completions/git
# fzf bash completion
source /usr/share/bash-completion/completions/fzf
source /usr/share/fzf/key-bindings.bash


# git status in prompt
source /usr/share/git/git-prompt.sh
export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;33m\]$(__git_ps1)\[\033[01;34m\] \$\[\033[00m\] 󰣨 '
export GIT_PS1_SHOWDIRTYSTATE=1
export PATH=/home/neo/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/opt/bin:/usr/lib/llvm/17/bin
