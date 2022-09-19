#!/bin/bash

. ./config.sh

printf 'Proceed doing your git config and sign everything (y/n)? '
read git_config

if echo "$git_config" | grep -iq "^y" ;then
    echo "Configuring git"
    bash -ex ./git-config.sh
fi

echo "done"