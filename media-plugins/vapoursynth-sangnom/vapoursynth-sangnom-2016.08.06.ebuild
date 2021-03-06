# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="A rewrite version of AVISynth SangNom2"
HOMEPAGE="https://bitbucket.org/James1201/vapoursynth-sangnom"

inherit mercurial
EHG_REPO_URI="https://bitbucket.org/James1201/${PN}"
EHG_REVISION="016bf2359f579c897948ccf72bca31ad75f5993a"
KEYWORDS="~amd64 ~x86"

LICENSE="MIT"
SLOT="0"
IUSE="doc cpu_flags_x86_sse2"

RDEPEND+="
	media-libs/vapoursynth
"
DEPEND="${RDEPEND}
"

src_configure() {
	commonflags="-Wall -fPIC -shared -std=c++11"
	if use cpu_flags_x86_sse2; then
		commonflags+=" -msse2 -DVS_TARGET_CPU_X86=1"
	fi
	libname="libsangnom.so"
}

src_compile() {
	echo "$(tc-getCC) ${commonflags} ${CFLAGS} $(pkg-config --cflags vapoursynth) sangnom_c.cpp -o ${libname}"
	$(tc-getCC) ${commonflags} ${CFLAGS} $(pkg-config --cflags vapoursynth) sangnom_c.cpp -o ${libname} || die
}

src_install() {
	use doc && DOCS=( "${WORKDIR}/${P}/README.md" ) && einstalldocs
	exeinto "/usr/$(get_libdir)/vapoursynth/"
	doexe ${libname}
}
