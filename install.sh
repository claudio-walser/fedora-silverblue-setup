#!/bin/bash

. ./config.sh

printf 'RPM Fusion - proceed installation? (y/N)'
read rpmfusion
if echo "$rpmfusion" | grep -iq "^y" ;then
    bash -x ./rpm-fusion.sh
fi

printf 'Packages - proceed installation? (y/N)'
read packages
if echo "$packages" | grep -iq "^y" ;then
    bash -x ./packages.sh
fi

printf 'Sublime - proceed installation? (y/N)'
read sublime
if echo "$sublime" | grep -iq "^y" ;then
    bash -x ./sublime.sh
fi

printf 'Flatpak - proceed installation? (y/N)'
read flatpak
if echo "$flatpak" | grep -iq "^y" ;then
    bash -x ./flatpak.sh
fi

printf 'Yubikey - proceed configuration? (y/N)'
read yubikey
if echo "$yubikey" | grep -iq "^y" ;then
    bash -x ./yubikey.sh
fi

printf 'Git - proceed configuration? (y/N)'
read git_config
if echo "$git_config" | grep -iq "^y" ;then
    bash -x ./git-config.sh
fi






. ~/.bashrc

echo "done"
