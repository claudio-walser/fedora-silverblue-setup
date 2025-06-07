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

if $NVIDIA; then
    printf 'Nvidia - proceed installation? (y/N)'
    read nvidia
    if echo "$nvidia" | grep -iq "^y" ;then
        bash -x ./nvidia.sh
    fi
fi
#printf 'Sublime - proceed installation? (y/N)'
#read sublime
#if echo "$sublime" | grep -iq "^y" ;then
#    bash -x ./sublime.sh
#fi

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


printf 'Kubectl - proceed configuration? (y/N)'
read kubectl
if echo "$kubectl" | grep -iq "^y" ;then
    bash -x ./kubectl.sh
fi

printf 'Development Setup - proceed configuration? (y/N)'
read development
if echo "$development" | grep -iq "^y" ;then
    bash -x ./development.sh
fi

printf 'udev Rules - proceed configuration? (y/N)'
read udev
if echo "$udev" | grep -iq "^y" ;then
    bash -x ./udev-rules.sh
fi

printf 'Office Tools - proceed installation? (y/N)'
read officeTools
if echo "$officeTools" | grep -iq "^y" ;then
    bash -x ./office-tools.sh
fi

printf 'Cosmic Desktop Environment - proceed installation? (y/N)'
read cosmicDesktop
if echo "$cosmicDesktop" | grep -iq "^y" ;then
    bash -x ./cosmic.sh
fi

printf 'gTile Gnome Excentsion - proceed installation? (y/N)'
read gTile
if echo "$gTile" | grep -iq "^y" ;then
    bash -x ./gTile.sh
fi




. ~/.bashrc

echo "done"
