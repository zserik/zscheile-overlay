# Copyright 2017-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.3.0

EAPI=7

CRATES="
adler32-1.1.0
ansi_term-0.11.0
ansi_term-0.12.1
anyhow-1.0.31
atty-0.2.14
bincode-1.2.1
bitflags-1.2.1
byteorder-1.3.4
cfg-if-0.1.10
clap-2.33.1
codespan-0.9.4
codespan-reporting-0.9.4
crc32fast-1.2.0
crulz-0.0.7
delegate-attr-0.2.7
either-1.5.3
flate2-1.0.14
getrandom-0.1.14
hermit-abi-0.1.14
itertools-0.9.0
lazy_static-1.4.0
libc-0.2.71
memmap-0.7.0
miniz_oxide-0.3.7
new_debug_unreachable-1.0.4
phf-0.8.0
phf_generator-0.8.0
phf_macros-0.8.0
phf_shared-0.8.0
ppv-lite86-0.2.8
precomputed-hash-0.1.1
proc-macro-hack-0.5.16
proc-macro2-1.0.18
quote-1.0.7
rand-0.7.3
rand_chacha-0.2.2
rand_core-0.5.1
rand_hc-0.2.0
rand_pcg-0.2.1
readfilez-0.2.3
serde-1.0.112
serde_derive-1.0.112
siphasher-0.3.3
string_cache-0.8.0
string_cache_codegen-0.5.1
strsim-0.8.0
syn-1.0.31
termcolor-1.1.0
textwrap-0.11.0
thiserror-1.0.20
thiserror-impl-1.0.20
unicode-width-0.1.7
unicode-xid-0.2.0
vec_map-0.8.2
wasi-0.9.0+wasi-snapshot-preview1
winapi-0.3.8
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.5
winapi-x86_64-pc-windows-gnu-0.4.0
"

inherit cargo

DESCRIPTION="a rust implementation of the 'crulz' macro language interpreter"
HOMEPAGE="https://github.com/zseri/crulz-rs"
SRC_URI="$(cargo_crate_uris ${CRATES})"
RESTRICT="mirror"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 ~arm x86"
IUSE="compile"
DEPEND+="
	>=virtual/rust-1.40.0"

src_compile() {
	cargo_src_compile --no-default-features $(usex compile "--features compile" "")
}

src_install() {
	cargo_src_install --no-default-features $(usex compile "--features compile" "")
}
