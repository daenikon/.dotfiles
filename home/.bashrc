# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

# Put your fun stuff here.

# Source all scripts in ~/.bashrc.d/
if [ -d "$HOME/.bashrc.d" ]; then
    for file in "$HOME/.bashrc.d"/*.sh; do
        [ -r "$file" ] && . "$file"
    done
fi
unset file

# Wrap the following commands for interactive use to avoid accidental file overwrites.
rm() { command rm -iv "${@}"; }
cp() { command cp -iv "${@}"; }
mv() { command mv -iv "${@}"; }
mkdir() { command mkdir -v "${@}"; }

# Customize shell prompt
export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;33m\]$(__git_ps1)\[\033[01;34m\] \$\[\033[00m\] 󰣨  > '

# Git status in prompt
source /usr/share/git/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1


