#!/bin/bash

$PACKAGE_MANAGER \
    akmod-nvidia \
    xorg-x11-drv-nvidia-cuda \
    xorg-x11-drivers \
    gnome-session-xsession \
    xorg-x11-xinit

rpm-ostree kargs --append=rd.driver.blacklist=nova_core --append=modprobe.blacklist=nova_core --append=rd.driver.blacklist=nouveau --append=modprobe.blacklist=nouveau --append=nvidia-drm.modeset=1
