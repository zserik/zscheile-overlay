# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4
JAVA_PKG_IUSE="doc examples"

inherit eutils java-pkg-2 java-ant-2

DESCRIPTION="An open-source AVR electronics prototyping platform"
HOMEPAGE="http://arduino.cc/ http://arduino.googlecode.com/"
SRC_URI="https://github.com/${PN}/Arduino/archive/${PV}.tar.gz mirror://gentoo/arduino-icons.tar.bz2"
LICENSE="GPL-2 GPL-2+ LGPL-2 CC-BY-SA-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="strip binchecks"
IUSE=""

COMMONDEP="
dev-java/jna
>dev-java/rxtx-2.1
dev-util/astyle"

RDEPEND="${COMMONDEP}
dev-embedded/avrdude
dev-embedded/uisp
sys-devel/crossdev
>=virtual/jre-1.5"

DEPEND="${COMMONDEP}
>=virtual/jdk-1.5"

EANT_GENTOO_CLASSPATH="jna,rxtx-2"
EANT_EXTRA_ARGS="-Dversion=${PV}"
EANT_BUILD_TARGET="build"
JAVA_ANT_REWRITE_CLASSPATH="yes"

src_unpack(){
	unpack ${A}
	cd ../"${S}"
	mv Arduino-${PV} arduino-${PV}
}

java_prepare() {
	# Remove the libraries to ensure the system
	# libraries are used
#	rm app/lib/* || die
	rm -rf app/src/processing/app/macosx || die
	# Patch build/build.xml - remove local jar files
	# for rxtx and ecj (use system wide versions)
	epatch "${FILESDIR}"/${PN}-1.5.8-build.xml.patch

	# Patch launcher script to include rxtx class/ld paths
	epatch "${FILESDIR}"/${PN}-1.0.3-script.patch
}

src_compile() {
	eant -f core/build.xml
	EANT_GENTOO_CLASSPATH_EXTRA="../core/core.jar"
	eant -f app/build.xml
	eant "${EANT_EXTRA_ARGS}" -f build/build.xml
}

src_install() {
	cd "${S}"/build/linux/work || die
	java-pkg_dojar lib/*.jar
	java-pkg_dolauncher ${PN} --pwd /usr/share/${PN} --main processing.app.Base

	if use examples; then
		java-pkg_doexamples examples
		docompress -x /usr/share/doc/${P}/examples/
	fi

	if use doc; then
		dodoc revisions.txt "${S}"/README.md
		dohtml -r reference
		java-pkg_dojavadoc "${S}"/build/javadoc/everything
	fi

	insinto "/usr/share/${PN}/"
	doins -r hardware libraries
	fowners -R root:uucp "/usr/share/${PN}/hardware"

	insinto "/usr/share/${PN}/lib"
	doins -r lib/*.txt lib/theme lib/*.jpg

	# use system avrdude
	# patching class files is too hard
	dodir "/usr/share/${PN}/hardware/tools/avr"
	dodir "/usr/share/${PN}/hardware/tools/avr/bin"
	dodir "/usr/share/${PN}/hardware/tools/avr/etc"
	dosym /usr/bin/avrdude "/usr/share/${PN}/hardware/tools/avr/bin/avrdude"
	dosym /etc/avrdude.conf "/usr/share/${PN}/hardware/tools/avr/etc/avrdude.conf"

	dosym /usr/lib64/libastyle.so "/usr/share/${PN}/lib/libastylej.so"
	dosym /usr/bin/avr-g++ "/usr/share/${PN}/hardware/tools/avr/bin/avr-g++"
	dosym /usr/bin/avr-gcc "/usr/share/${PN}/hardware/tools/avr/bin/avr-gcc"
	dosym /usr/bin/avr-ar "/usr/share/${PN}/hardware/tools/avr/bin/avr-ar"
	dosym /usr/bin/avr-objcopy "/usr/share/${PN}/hardware/tools/avr/bin/avr-objcopy"
	dosym /usr/bin/avr-size "/usr/share/${PN}/hardware/tools/avr/bin/avr-size"
	
	# install menu and icons
	domenu "${FILESDIR}/${PN}.desktop"
	for sz in 16 24 32 48 128 256; do
		newicon -s $sz \
			"${WORKDIR}/${PN}-icons/debian_icons_${sz}x${sz}_apps_${PN}.png" \
			"${PN}.png"
	done
}

pkg_postinst() {
	[ ! -x /usr/bin/avr-g++ ] && ewarn "Missing avr-g++; you need to crossdev -s4 avr"
}
