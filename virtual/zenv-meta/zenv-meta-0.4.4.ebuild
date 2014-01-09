# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=5

inherit zserik-virtual

DESCRIPTION="Erik Zscheile: meta environment package"

IUSE="X alsa gnome gtk introspection jack kde linguas_de mutter pam pulseaudio python qt systemd webkit-gtk zs_modules_media zs_modules_zserik"

REQUIRED_USE="gnome? ( gtk mutter )
	kde? ( qt )
	mutter? ( X )
	qt? ( X )
	webkit-gtk? ( gtk )"

RDEPEND="virtual/zenv-compiler[compiler_gcc]
	X? ( x11-base/xorg-server )
	gtk? ( x11-libs/gtk+[X?,introspection?] )
	mutter? ( x11-wm/mutter[introspection?] )
	systemd? ( sys-apps/systemd[introspection?,pam?,python?] )
	webkit-gtk? ( virtual/zenv-webkit-gtk[introspection?] )
	zs_modules_media? ( >=virtual/zenv-media-0.5[alsa?,gnome?,jack?,kde?,qt?] )
	zs_modules_zserik? ( zserik-base/zserik-common[linguas_de?] )"
