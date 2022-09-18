#!/bin/bash

. ./config.sh

printf 'Proceed doing your git config and sign everything (y/n)? '
read gitconfig
# if echo "$answer" | grep -iq "^y" ;then
if [ "$gitconfig" == "${gitconfig#[Yy]}" ] ;then
    . ./git-config.sh
fi