set -o nounset # exit when trying to use undeclared variables

curl -LO "https://github.com/bpozdena/OneDriveGUI/releases/download/v1.0.3/OneDriveGUI-1.0.3_fix150-x86_64.AppImage"
mv OneDriveGUI-1.0.3_fix150-x86_64.AppImage $HOME/.local/bin/onedrive-gui
chmod +x $HOME/.local/bin/onedrive-gui

if [ ! -f ~/Bilder/Logos/onedrive.png ]; then
    echo "Downloading onedrive logo"
    mkdir -p ~/Bilder/Logos/
    curl --location -o ~/Bilder/Logos/onedrive.png https://cdn.icon-icons.com/icons2/2592/PNG/512/onedrive_logo_icon_154478.png
fi

if [ ! -f ~/.local/share/applications/onedrive.desktop ]; then
    echo "Writing desktop file"
    cat > ~/.local/share/applications/onedrive.desktop <<EOL
#!/usr/bin/env xdg-open

#!/usr/bin/env xdg-open

[Desktop Entry]
Version=1.0
Type=Application
Exec=${HOME}/.local/bin/onedrive-gui
Name=Onedrive
Comment=Onedrive GUI
Icon=${HOME}/Bilder/Logos/onedrive.png

EOL