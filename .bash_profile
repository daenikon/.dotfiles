# This file is sourced by bash for login shells. The following line
# runs your .bashrc and is recommended by the bash info pages.
if [[ -f ~/.bashrc ]] ; then
	. ~/.bashrc
fi

# Wayland-specific env variables
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    export LIBVA_DRIVER_NAME=nvidia
    export XDG_SESSION_TYPE=wayland
    export GBM_BACKEND=nvidia-drm
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export NVD_BACKEND=direct
    export MOZ_ENABLE_WAYLAND=1
fi

# GTK
export GDK_SCALE=1
export GDK_DPI_SCALE=1
export GTK_THEME=Adwaita-dark

gnome_schema="org.gnome.desktop.interface"
gsettings set "$gnome_schema" font-name 'SauceCodePro Nerd Font 24'
gsettings set "$gnome_schema" gtk-theme Adwaita
gsettings set "$gnome_schema" cursor-theme 'Bibata-Modern-Classic'
gsettings set "$gnome_schema" cursor-size 48

# Start keychain and add SSH key
eval $(keychain --eval --agents ssh ~/.ssh/id_ed25519)
