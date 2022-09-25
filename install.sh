#!/bin/bash

. ./config.sh

printf 'Git - proceed configuration? (y/N)'
read git_config
if echo "$git_config" | grep -iq "^y" ;then
    bash -x ./git-config.sh
fi

printf 'Yubikey - proceed configuration? (y/N)'
read yubikey
if echo "$yubikey" | grep -iq "^y" ;then
    bash -x ./yubikey.sh
fi


. ~/.bashrc

echo "done"
