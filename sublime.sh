set -o nounset # exit when trying to use undeclared variables

# install sublime text - should probably install this over their repo:
# https://www.sublimetext.com/docs/linux_repositories.html#dnf
echo "Downloading Sublime"
curl --location -o /tmp/sublime.rpm https://download.sublimetext.com/sublime-text-4169-1.x86_64.rpm
$PACKAGE_MANAGER /tmp/sublime.rpm
$REBOOT


