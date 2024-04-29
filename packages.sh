set -o nounset # exit when trying to use undeclared variables

$PACKAGE_MANAGER \
	gcc-c++ \
	akmod-nvidia \
	clamav \
	clamav-data \
	clamav-filesystem \
	clamav-lib \
	clamav-scanner-systemd \
	clamav-server \
	clamav-server-systemd \
	clamav-update \
	gnome-tweak-tool \
	golang \
	golang-shared \
	gstreamer-plugins-bad \
	gstreamer-plugins-ugly \
	gstreamer1-plugin-openh264 \
	gstreamer1-plugins-bad-freeworld \
	gstreamer1-vaapi \
	libXcursor-devel \
	libXi-devel \
	libXinerama-devel \
	libXrandr-devel \
	libXxf86vm-devel \
	mesa-libGL-devel \
	mingw64-gcc \
	mozilla-openh264 \
	nodejs \
	pam-u2f \
	pam_yubico \
	pamu2fcfg \
	python-pip \
	yubico-piv-tool \
	onedrive
$REBOOT
