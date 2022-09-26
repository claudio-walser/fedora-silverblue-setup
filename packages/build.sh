#!/bin/bash

cd fix-sudo
fpm -s dir --after-install etc/after-install.sh -t rpm -n fix-sudo -v 0.0.1 -C ./
cd -