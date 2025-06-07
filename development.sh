set -o nounset # exit when trying to use undeclared variables


# add user to group dialout for arduino-ide flatpak
usermod -aG dialout ${USER}

ln -s /var/lib/flatpak/exports/bin/com.sublimetext.three $HOME/.local/bin/subl
ln -s /var/lib/flatpak/exports/bin/com.vscodium.codium $HOME/.local/bin/vscode


# vscode extensions
# https://KalAster.gallery.vsassets.io/_apis/public/gallery/publisher/KalAster/extension/vscode-riotjs/latest/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage
