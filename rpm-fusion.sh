set -o nounset # exit when trying to use undeclared variables$PACKAGE_MANAGER pam-u2f

curl --location -o /tmp/rpm-fusion-free.rpm https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-${FEDORA_VERSION}.noarch.rpm
curl --location -o /tmp/rpm-fusion-non-free.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-${FEDORA_VERSION}.noarch.rpm

$PACKAGE_MANAGER /tmp/rpm-fusion-free.rpm /tmp/rpm-fusion-non-free.rpm
$REBOOT
