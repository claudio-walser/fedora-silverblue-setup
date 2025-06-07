set -o nounset # exit when trying to use undeclared variables

sudo cp ./etc/udev/rules.d/* /etc/udev/rules.d/
sudo chmod a+r /etc/udev/rules.d/*
sudo udevadm control --reload

