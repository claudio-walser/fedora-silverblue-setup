set -o nounset # exit when trying to use undeclared variables

# install yubikey manager
APPLICATION=~/.local/bin/yubikey-manager
echo "Downloading latest yubikey-manager from yubico"
curl --location -o $APPLICATION https://developers.yubico.com/yubikey-manager-qt/Releases/yubikey-manager-qt-latest-linux.AppImage
chmod +x $APPLICATION

# make ykman available through an alias

if [ -d ~/.bashrc.d ]; then
    if [ ! -f ~/.bashrc.d/ykman ]; then
        echo "alias ykman=\"yubikey-manager ykman\"" | tee ~/.bashrc.d/ykman
    else
        echo "Alias ykman already done"
    fi
else
    grep --silent "alias ykman=\"yubikey-manager ykman\"" ~/.bashrc
    if [ $? -gt  0 ]; then
        echo "alias ykman=\"yubikey-manager ykman\"" | tee -a ~/.bashrc
    else
        echo "Alias ykman already done"
    fi
fi



if [ ! -f ~/.local/share/applications/yubikey-manager.desktop ]; then
    echo "Writing desktop file"
    cat > ~/.local/share/applications/yubikey-manager.desktop <<EOL
#!/usr/bin/env xdg-open

[Desktop Entry]
Version=1.0
Type=Application
Exec=${APPLICATION}
Name=Yubikey Manager
Comment=Yubikey Manager
Icon=/home/claudio/Bilder/Logos/yubikey-manager.png
EOL

else
    echo "Desktop file already done"

fi
