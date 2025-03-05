#!/bin/bash

# If app-shells/bash-completion installed
complete -F _root_command doas

# Git bash completion
[ -r /usr/share/bash-completion/completions/git ] && source /usr/share/bash-completion/completions/git
# fzf bash completion
[ -r /usr/share/bash-completion/completions/fzf ] && source /usr/share/bash-completion/completions/fzf
[ -r /usr/share/fzf/key-bindings.bash ] && source /usr/share/fzf/key-bindings.bash


# Enable cycling through options with Tab
#bind 'set menu-complete on'
bind 'TAB:menu-complete'

# Show all possible completions on first Tab press
bind 'set show-all-if-ambiguous on'
# Complete hidden files (.dotfiles)
bind 'set match-hidden-files on'
# Complete filenames case-insensitively
bind 'set completion-ignore-case on'

# Cycle through history based on characters already typed on the line
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

# Keep Ctrl-Left and Ctrl-Right working when the above are used
bind '"\e[1;5C":forward-word'
bind '"\e[1;5D":backward-word'


#  Shift + Tab to cycle backwards
bind '"\e[Z": menu-complete-backward'

# Perform partial (common) completion on the first Tab press, only start
# cycling full results on the second Tab press (from bash version 5)
bind "set menu-complete-display-prefix on"
