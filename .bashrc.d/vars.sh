#!/bin/bash

# Extended PATH
export PATH="$HOME/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:$HOME/.cargo/bin:$HOME/bin"

# Add JavaFX (temporarily)
export PATH_TO_FX=":$HOME/javafx/javafx-sdk-23.0.1/lib"

# No double entries in the shell history.
export HISTCONTROL="${HISTCONTROL:-erasedups:ignoreboth}"
export HISTSIZE="${HISTSIZE:-2000}"
export HISTFILESIZE="${HISTFILESIZE:-2000}"

# Setup $XDG_CONFIG_HOME
export XDG_CONFIG_HOME=$HOME/.config

# Man pages in neovim pager!
export MANPAGER='nvim +Man!'

# for mosh to work in Termius
export TERM="xterm-256color"
