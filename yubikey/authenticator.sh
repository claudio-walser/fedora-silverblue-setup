set -o nounset # exit when trying to use undeclared variables

# install yubikey manager
APPLICATION=~/.local/bin/yubikey-authenticator
echo "Downloading latest yubikey-authenticator from yubico"
curl --location -o $APPLICATION https://developers.yubico.com/yubioath-desktop/Releases/yubioath-desktop-latest-linux.AppImage
chmod +x $APPLICATION


if [ ! -f ~/.local/share/applications/yubikey-authenticator.desktop ]; then
    echo "Writing desktop file"
    cat > ~/.local/share/applications/yubikey-authenticator.desktop <<EOL
#!/usr/bin/env xdg-open

[Desktop Entry]
Version=1.0
Type=Application
Exec=${APPLICATION}
Name=Yubikey authenticator
Comment=Yubikey authenticator
Icon=/home/claudio/Bilder/Logos/yubikey-authenticator.png
EOL

else
    echo "Desktop file already done"
fi
