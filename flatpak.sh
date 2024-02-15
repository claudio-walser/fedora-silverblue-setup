set -o nounset # exit when trying to use undeclared variables

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak install \
	com.brave.Browser \
	com.github.IsmaelMartinez.teams_for_linux \
	org.gimp.GIMP \
	org.blender.Blender \
	runtime/org.kde.KStyle.Adwaita/x86_64/5.15 \
	org.keepassxc.KeePassXC \
	org.libreoffice.LibreOffice \
	org.openscad.OpenSCAD \
	org.signal.Signal \
	org.videolan.VLC \
	com.slack.Slack \
	com.discordapp.Discord \
	org.gnome.seahorse.Application \
	com.sublimetext.three


content-security-policy: object-src 'none'; script-src 'none'; base-uri 'none';