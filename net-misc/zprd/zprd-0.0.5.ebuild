# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit zserik-cmake

DESCRIPTION="ZPRD - Zscheile Peer Routing Daemon"
KEYWORDS="arm amd64 x86"
LICENSE="GPL-3"

RDEPEND="sys-apps/coreutils
	sys-apps/grep
	sys-apps/iproute2
	virtual/daemontools"

src_install() {
	default

	echo " - install documentation"
	dodoc README doc/files/CONF doc/files/zprd.conf

	echo " - install service files"
	dodir /etc/zprd
	cp -R -t "${D}/etc" "${S}/doc/srv/service/zprd/" || die "install service files failed"
}

pkg_postinst() {
	einfo "To activate the server:"
	einfo " 1. setup /etc/zprd.conf"
	einfo " 2. ln -s -t /service /etc/zprd"
	einfo " 3. rc-update add svscan"
	einfo " 4. /etc/init.d/svscan restart"
}
