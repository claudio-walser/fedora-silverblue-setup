set -o nounset # exit when trying to use undeclared variables


# add user to group dialout for arduino-ide flatpak
usermod -aG dialout ${USER}

ln -s /var/lib/flatpak/exports/bin/com.sublimetext.three $HOME/.local/bin/subl
ln -s /var/lib/flatpak/exports/bin/com.vscodium.codium $HOME/.local/bin/vscode

# .bashrc.d to set android home
mkdir -p ~/.bashrc.d
if [ ! -f ~/.bashrc.d/android ]; then
    echo "Writing pgp-ssh .bashrc.d file"
    cat > ~/.bashrc.d/android <<EOL
export ANDROID_HOME=/var/home/claudio/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools
EOL

# vscode extensions
# https://KalAster.gallery.vsassets.io/_apis/public/gallery/publisher/KalAster/extension/vscode-riotjs/latest/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage
