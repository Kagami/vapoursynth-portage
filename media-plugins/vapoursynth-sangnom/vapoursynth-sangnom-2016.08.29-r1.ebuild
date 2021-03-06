# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="A rewrite version of AVISynth SangNom2"
HOMEPAGE="https://bitbucket.org/James1201/vapoursynth-sangnom"

inherit mercurial
EHG_REPO_URI="https://bitbucket.org/James1201/${PN}"
EHG_REVISION="24bf165026c66ea5cf016fb50fc311f135969016"
KEYWORDS="~amd64 ~x86"

LICENSE="MIT"
SLOT="0"
IUSE="doc cpu_flags_x86_sse2"

RDEPEND+="
	media-libs/vapoursynth
"
DEPEND="${RDEPEND}
"

src_prepare() {
	eapply_user
	fperms +x autogen.sh
	./autogen.sh
}

src_configure() {
	use doc && DOCS=( "${WORKDIR}/${P}/README.md" )
	econf --libdir="/usr/$(get_libdir)/vapoursynth/"
}
