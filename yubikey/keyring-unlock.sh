set -o nounset # exit when trying to use undeclared variables

# create pre-requisite directories
mkdir -p $HOME/.sec
mkdir -p $HOME/.config/systemd/user/

pip install --user --upgrade gnome-keyring-gpg-unlock
gnome-keyring-gpg-unlock setup --public-key $PGP_KEY_ID --secret $HOME/.sec/gnome-keyring
