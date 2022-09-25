#!/bin/bash

cd fix-sudo
fpm -s dir -t rpm -n fix-sudo -v 0.0.1 -C ./
cd -