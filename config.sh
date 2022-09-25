#!/bin/bash

export PACKAGE_MANAGER="rpm-ostree" #sudo dnf|rpm-ostree

export PGP_KEY_ID="5638393858B04300"
export PGP_KEY_EMAIL="info@gitcd.io"
export USER_NAME="Claudio Walser"

export YUBIKEY_LINUX_LOGIN_TYPE="u2f" # chalresp|u2f (u2f requires a touch)
export YUBIKEY_LINUX_GDM_LEVEL="sufficient" # sufficient|required - gdm login
export YUBIKEY_LINUX_SUDO_LEVEL="sufficient" # sufficient|required - using sudo
export YUBIKEY_LINUX_LOGIN_LEVEL="sufficient" # sufficient|required - tty logins