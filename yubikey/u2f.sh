set -o nounset # exit when trying to use undeclared variables

# if Yubico U2F keys arent present yet
if [ ! -f "/etc/Yubico/u2f_keys" ]; then
    printf 'Short-Touch on the key. Are you ready? (y/N)!'
    read u2f
    if echo "$u2f" | grep -iq "^y" ;then
        mkdir -p ~/.config/Yubico
        pamu2fcfg > ~/.config/Yubico/u2f_keys
        # move to a root only writable location for security
        sudo mv ~/.config/Yubico /etc
    fi
else
    echo "U2F Keys already present!"
fi


if [ ! -f "/etc/pam.d/yubikey-u2f-required" ]; then
    echo "auth       required     pam_u2f.so authfile=/etc/Yubico/u2f_keys" | sudo tee /etc/pam.d/yubikey-u2f-required
else
    echo "/etc/pam.d/yubikey-u2f-required already there!"
fi

if [ ! -f "/etc/pam.d/yubikey-u2f-sufficient" ]; then
    echo "auth       sufficient     pam_u2f.so authfile=/etc/Yubico/u2f_keys" | sudo tee /etc/pam.d/yubikey-u2f-sufficient
else
    echo "/etc/pam.d/yubikey-u2f-sufficient already there!"
fi
