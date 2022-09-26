set -o nounset # exit when trying to use undeclared variables

# if packages not installed
if [ ! -f /usr/lib64/security/pam_u2f.so ]; then
    $PACKAGE_MANAGER install pam-u2f
else
    echo "pam u2f packages already installed!"
fi

which pamu2fcfg &>/dev/null
if [ $? -gt  0 ]; then
    $PACKAGE_MANAGER install pamu2fcfg
else
    echo "pam u2f packages already installed!"
fi

# install/upgrade yubico software
bash ./yubikey/manager.sh
bash ./yubikey/authenticator.sh


if [ $YUBIKEY_LINUX_LOGIN_TYPE == "chalresp" ]; then
    bash ./yubikey/chalresp.sh
elif [ $YUBIKEY_LINUX_LOGIN_TYPE == "u2f" ]; then
    bash ./yubikey/u2f.sh
else
    print "Invalid YUBIKEY_LINUX_LOGIN_TYPE: $YUBIKEY_LINUX_LOGIN_TYPE - chalresp|u2f are valid values."
    exit 1
fi

# protect gdm, sudo and tty logins
grep --silent "yubikey-${YUBIKEY_LINUX_LOGIN_TYPE}-${YUBIKEY_LINUX_GDM_LEVEL}" /etc/pam.d/gdm-password
if [ $? -gt  0 ]; then
    GDM_FILE_CONTENT_CLEAN=$(grep -v yubikey /etc/pam.d/gdm-password)
    GDM_FIND="auth        substack      password-auth"
    GDM_FILE_CONTENT_NEW=$(echo "$GDM_FILE_CONTENT_CLEAN" | sed "s/${GDM_FIND}/auth        include       yubikey-${YUBIKEY_LINUX_LOGIN_TYPE}-${YUBIKEY_LINUX_GDM_LEVEL}\n${GDM_FIND}/g")
    echo "$GDM_FILE_CONTENT_NEW" | sudo tee /etc/pam.d/gdm-password
else
    echo "/etc/pam.d/gdm-password already done"
fi

grep --silent "yubikey-${YUBIKEY_LINUX_LOGIN_TYPE}-${YUBIKEY_LINUX_SUDO_LEVEL}" /etc/pam.d/sudo
if [ $? -gt  0 ]; then
    SUDO_FILE_CONTENT_CLEAN=$(grep -v yubikey /etc/pam.d/sudo)
    SUDO_FIND="auth       include      system-auth"
    SUDO_FILE_CONTENT_NEW=$(echo "$SUDO_FILE_CONTENT_CLEAN" | sed "s/${SUDO_FIND}/auth        include       yubikey-${YUBIKEY_LINUX_LOGIN_TYPE}-${YUBIKEY_LINUX_SUDO_LEVEL}\n${SUDO_FIND}/g")
    echo "$SUDO_FILE_CONTENT_NEW" | sudo tee /etc/pam.d/sudo
else
    echo "/etc/pam.d/sudo already done"
fi

grep --silent "yubikey-${YUBIKEY_LINUX_LOGIN_TYPE}-${YUBIKEY_LINUX_LOGIN_LEVEL}" /etc/pam.d/login
if [ $? -gt  0 ]; then
    LOGIN_FILE_CONTENT_CLEAN=$(grep -v yubikey /etc/pam.d/login)
    LOGIN_FIND="auth       substack     system-auth"
    LOGIN_FILE_CONTENT_NEW=$(echo "$LOGIN_FILE_CONTENT_CLEAN" | sed "s/${LOGIN_FIND}/auth        include       yubikey-${YUBIKEY_LINUX_LOGIN_TYPE}-${YUBIKEY_LINUX_LOGIN_LEVEL}\n${LOGIN_FIND}/g")
    echo "$LOGIN_FILE_CONTENT_NEW" | sudo tee /etc/pam.d/login
else
    echo "/etc/pam.d/login already done"
fi

exit 0
