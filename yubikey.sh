set -o nounset # exit when trying to use undeclared variables

# if package not installed
which pamu2fcfgs &>1
if [ $? -gt  0 ]; then
    $PACKAGE_MANAGER install pam-u2f pamu2fcfg
else
    echo "pam u2f packages already installed!"
fi

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
    echo "U2F Keys already present - going on!"
fi

if [ ! -f "/etc/pam.d/yubikey-required" ]; then
    echo "auth       required     pam_u2f.so authfile=/etc/Yubico/u2f_keys" | sudo tee /etc/pam.d/yubikey-required
else
    echo "/etc/pam.d/yubikey-required already there!"
fi

if [ ! -f "/etc/pam.d/yubikey-sufficient" ]; then
    echo "auth       sufficient     pam_u2f.so authfile=/etc/Yubico/u2f_keys" | sudo tee /etc/pam.d/yubikey-sufficient
else
    echo "/etc/pam.d/yubikey-sufficient already there!"
fi

grep --silent "yubikey-" /etc/pam.d/gdm-password
GDM_DONE=$?
if [ ! $GDM_DONE ]; then
    GDM_FILE_CONTENT=$(awk '/auth        substack      password-auth/{print "auth        include       yubikey-sufficient"}1' /etc/pam.d/gdm-password)
    echo "$GDM_FILE_CONTENT" | sudo tee /etc/pam.d/gdm-password
else
    echo "/etc/pam.d/gdm-password already done"
fi

grep --silent "yubikey-" /etc/pam.d/sudo
SUDO_DONE=$?
if [ ! $SUDO_DONE ]; then
    SUDO_FILE_CONTENT=$(awk '/auth       include      system-auth/{print "auth       include      yubikey-sufficient"}1' /etc/pam.d/sudo)
    echo "$SUDO_FILE_CONTENT" | sudo tee /etc/pam.d/sudo
else
    echo "/etc/pam.d/gdm-password already done"
fi

grep --silent "yubikey-" /etc/pam.d/login
LOGIN_DONE=$?
if [ ! $LOGIN_DONE ]; then
    LOGIN_FILE_CONTENT=$(awk '/auth       substack     system-auth/{print "auth       include      yubikey-sufficient"}1' /etc/pam.d/login)
    echo "$LOGIN_FILE_CONTENT" | sudo tee /etc/pam.d/login
else
    echo "/etc/pam.d/gdm-password already done"
fi
