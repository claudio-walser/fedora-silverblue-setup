#!/bin/bash

chmod +x /etc/fix-sudo.sh
systemctl daemon-reload
systemctl enable fix-sudo.service
