set -o nounset # exit when trying to use undeclared variables

flatpak install \
	com.brave.Browser \
	com.microsoft.Teams \
	io.lbry.lbry-app \
	org.gimp.GIMP \
	runtime/org.kde.KStyle.Adwaita/x86_64/5.15 \
	org.keepassxc.KeePassXC \
	org.libreoffice.LibreOffice \
	org.openscad.OpenSCAD \
	org.signal.Signal \
	org.videolan.VLC \
	com.slack.Slack
