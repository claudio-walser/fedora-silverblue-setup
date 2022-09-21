#!/bin/bash

. ./config.sh

printf 'Git - proceed configuration? (y/n)'
read git_config
if echo "$git_config" | grep -iq "^y" ;then
    bash -x ./git-config.sh
fi

printf 'Yubikey - proceed configuration? (y/n)'
read yubikey
if echo "$yubikey" | grep -iq "^y" ;then
    bash -x ./yubikey.sh
fi

echo "done"
