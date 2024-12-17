set -o nounset # exit when trying to use undeclared variables$PACKAGE_MANAGER pam-u2f

$PACKAGE_MANAGER rpmfusion-free-release rpmfusion-nonfree-release
$REBOOT
