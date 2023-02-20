set -o nounset # exit when trying to use undeclared variables

pip install --user --upgrade gnome-keyring-gpg-unlock
gnome-keyring-gpg-unlock setup --public-key $PGP_KEY_ID --secret $HOME/.sec/gnome-keyring