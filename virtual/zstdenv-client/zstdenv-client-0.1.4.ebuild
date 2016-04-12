# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
EAPI=5

inherit zserik-virtual

DESCRIPTION="Zscheile Standard Environment for Clients"

KEYWORDS="arm amd64 x86"
IUSE="+emacs experimental +flash games +geosci +kerberos minimal mp3 +vala +vnc wine +xdm +xfce +zadist"

RDEPEND="app-admin/sudo
	app-admin/sysklogd
	app-editors/nano
	app-misc/mc
	app-portage/eix
	app-portage/gentoolkit
	app-text/dos2unix
	app-text/poppler[cairo]
	app-text/tree
	!minimal? (
		app-arch/xarchiver
		app-editors/gedit
		app-office/libreoffice
		app-shells/dash
		app-text/evince
	)

	dev-perl/Module-Build
	dev-util/strace
	dev-vcs/git
	!minimal? (
		dev-db/zdbc
		dev-lang/ruby
		dev-util/geany
		dev-vcs/subversion
		mail-client/thunderbird
	)

	media-fonts/font-misc-misc
	media-gfx/gqview
	media-libs/harfbuzz[icu]
	media-libs/libpng[apng]
	media-plugins/gst-plugins-meta[mp3?]
	media-plugins/gst-plugins-openh264
	media-sound/alsa-utils
	media-video/mplayer
	media-video/parole
	!minimal? (
		media-gfx/gimp
		media-gfx/imagemagick
		media-sound/lmms
	)

	net-analyzer/nmap[zenmap]
	net-analyzer/tcpdump
	net-analyzer/traceroute
	net-dns/bind-tools
	net-fs/nfs-utils
	net-ftp/gftp[gtk]
	net-misc/ntp
	net-print/cups
	!minimal? (
		net-analyzer/wireshark
		sci-visualization/gnuplot
	)

	sys-apps/mlocate
	sys-block/gparted
	sys-boot/grub
	sys-boot/os-prober
	sys-fs/dosfstools
	sys-kernel/gentoo-sources
	!=sys-libs/glibc-2.22-r4
	sys-libs/gpm
	sys-process/cronie
	sys-process/lsof
	!minimal? (
		sys-fs/cryptsetup
	)

	www-client/links
	!minimal? (
		www-client/firefox
	)

	x11-apps/xedit
	x11-apps/xhost
	x11-apps/xinit
	x11-apps/xload
	x11-base/xorg-server
	x11-terms/rxvt-unicode
	x11-terms/xterm

	virtual/zenv-media[flash?]

	|| (
		net-analyzer/netcat
		net-analyzer/netcat6
	)
	emacs? (
		app-editors/emacs
		app-emacs/auctex
		app-text/aspell
	)
	experimental? (
		gnome-extra/gnome-builder[vala?]
	)
	games? (
		games-board/aisleriot
	)
	geosci? (
		sci-geosciences/gpsbabel
		sci-geosciences/josm
	)
	kerberos? (
		sys-auth/pambase[pam_krb5]
	)
	vala? (
		app-admin/eselect-vala
		dev-lang/vala
	)
	vnc? (
		net-misc/tightvnc
	)
	wine? (
		app-emulation/wine
	)
	xdm? (
		x11-misc/slim
	)
	xfce? (
		xfce-base/xfce4-meta
		xfce-extra/xfce4-cpugraph-plugin
		xfce-extra/xfce4-notes-plugin
	)
	zadist? (
		net-misc/zadist
	)
	"
