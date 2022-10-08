set -o nounset # exit when trying to use undeclared variables

# install yubikey manager
echo "Downloading Sublime"
curl --location -o /tmp/sublime.rpm https://download.sublimetext.com/sublime-text-4126-1.x86_64.rpm
$PACKAGE_MANAGER /tmp/sublime.rpm
$REBOOT


