set -o nounset # exit when trying to use undeclared variables

sudo rm -f /etc/udev/rules.d/*

sudo cp ./etc/udev/rules.d/* /etc/udev/rules.d/
sudo chmod a+r /etc/udev/rules.d/*
sudo udevadm control --reload

