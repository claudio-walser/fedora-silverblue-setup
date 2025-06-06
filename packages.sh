set -o nounset # exit when trying to use undeclared variables

$PACKAGE_MANAGER \
	android-tools \
	clamav \
	clamav-data \
	clamav-filesystem \
	clamav-lib \
	clamav-scanner-systemd \
	clamav-server \
	clamav-server-systemd \
	clamav-update \
 	gcc-c++  \
	gnome-tweak-tool \
	golang \
	golang-shared \
	gstreamer-plugins-bad \
	gstreamer-plugins-ugly \
	gstreamer1-plugins-bad-freeworld \
	gstreamer1-vaapi \
	libXcursor-devel \
	libXi-devel \
	libXinerama-devel \
	libXrandr-devel \
	libXxf86vm-devel \
	mingw64-gcc \
	nodejs \
	pam-u2f \
	pam_yubico \
	pamu2fcfg \
	python-pip \
	yubico-piv-tool \
$REBOOT
