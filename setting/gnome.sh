customKey="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings"
customKeyPrefix="org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$customKey"
gsettings set "$customKeyPrefix/custom0/" name 'Terminal'
gsettings set "$customKeyPrefix/custom0/" command 'gnome-terminal'
gsettings set "$customKeyPrefix/custom0/" binding '<Primary><Alt>t'

gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['$customKey/custom0/']"

gsettings set org.gnome.mutter center-new-windows true