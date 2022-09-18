#!/bin/bash

. ./config.sh

printf 'Proceed doing your git config and sign everything (y/n)? '
read gitconfig
# if echo "$answer" | grep -iq "^y" ;then
echo $gitconfig
if [ "$gitconfig" == "${gitconfig#[Yy]}" ] ;then
    echo "doit"
    . ./git-config.sh
fi
echo "done"