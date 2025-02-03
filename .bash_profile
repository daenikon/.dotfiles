# This file is sourced by bash for login shells. The following line
# runs your .bashrc and is recommended by the bash info pages.
if [[ -f ~/.bashrc ]] ; then
	. ~/.bashrc
fi

# GTK
#export GDK_SCALE=1
#export GDK_DPI_SCALE=1

# Start keychain and add SSH key
eval $(keychain --quiet --eval --agents ssh ~/.ssh/id_ed25519)

# For pipewire
# Ensure XDG_RUNTIME_DIR is set
if test -z "$XDG_RUNTIME_DIR"; then
    export XDG_RUNTIME_DIR=$(mktemp -d /tmp/$(id -u)-runtime-dir.XXX)
fi
