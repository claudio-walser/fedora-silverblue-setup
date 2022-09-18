#!/bin/bash

set -o nounset # exit when trying to use undeclared variables

git config --global user.email ${PGP_KEY_EMAIL}
git config --global user.name ${USER_NAME}

git config --global user.signingkey ${PGP_KEY_ID}
git config --global commit.gpgsign true
#git config --global tag.gpgsign true # not sure if this option even exists, sorry
