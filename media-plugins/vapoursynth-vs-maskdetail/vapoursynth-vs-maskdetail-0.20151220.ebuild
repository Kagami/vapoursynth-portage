# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python3_{4,5} )

inherit python-utils-r1 python-single-r1 git-r3

DESCRIPTION="A function to use invks/debilinear"
HOMEPAGE="http://forum.doom9.org/showthread.php?t=171546"
EGIT_REPO_URI="https://github.com/MonoS/VS-MaskDetail.git"
EGIT_COMMIT="1f927c842820ec61583c9b87ba3c169b15e09c4c"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND+="
	media-libs/vapoursynth[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}
"

src_install(){
	insinto "$(python_get_sitedir)"
	doins MaskDetail.py
}
