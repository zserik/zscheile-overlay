# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit zserik-minimal

DESCRIPTION="ZModulesCtl - Zscheile Modules Control"
KEYWORDS="arm amd64 x86"
RDEPEND="sys-apps/coreutils"

src_install() {
	dodir /etc/zmodules
	dodir /usr/lib/zmodules
	dobin zmodulesctl
}
