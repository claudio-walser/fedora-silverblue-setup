#!/bin/bash
source /etc/os-release


export PACKAGE_MANAGER="rpm-ostree install --idempotent" #sudo dnf install|rpm-ostree install --idempotent
export REBOOT="echo 'systemctl reboot'"

export FEDORA_VERSION=$VERSION_ID

export PGP_KEY_ID="5638393858B04300"
export PGP_KEY_EMAIL="info@gitcd.io"
export PGP_SSH_KEYGRIP="80DDBDDE7AB2DFFEF50A6A4AE33DC5F44C2121B2"
export USER_NAME="Claudio Walser"

export YUBIKEY_LINUX_LOGIN_TYPE="chalresp" # chalresp|u2f (u2f requires a touch)
export YUBIKEY_LINUX_GDM_LEVEL="sufficient" # sufficient|required - gdm login
export YUBIKEY_LINUX_SUDO_LEVEL="sufficient" # sufficient|required - using sudo
export YUBIKEY_LINUX_LOGIN_LEVEL="sufficient" # sufficient|required - tty logins
