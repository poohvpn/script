customKey="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings"
customKeyPrefix="org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$customKey"
gsettings set "$customKeyPrefix/custom0/" name 'Terminal'
gsettings set "$customKeyPrefix/custom0/" command 'gnome-terminal'
gsettings set "$customKeyPrefix/custom0/" binding '<Primary><Alt>t'

gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['$customKey/custom0/']"

gsettings set org.gnome.mutter center-new-windows true

# extensions
gnome-extensions enable nightthemeswitcher@romainvigier.fr
gnome-extensions disable pamac-updates@manjaro.org
gnome-extensions disable dash-to-dock@micxgx.gmail.com
gnome-extensions enable dash-to-panel@jderose9.github.com

cat <<EOF > /.config/autostart/guake.desktop
[Desktop Entry]
Name=Guake Terminal
Comment=Use the command line in a Quake-like terminal
TryExec=guake
Exec=guake
Icon=guake
Type=Application
Categories=GNOME;GTK;System;Utility;TerminalEmulator;
StartupNotify=true
X-Desktop-File-Install-Version=0.22
EOF