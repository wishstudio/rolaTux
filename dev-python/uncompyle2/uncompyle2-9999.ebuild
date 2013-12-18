# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit distutils git-2

DESCRIPTION="A Python 2.5, 2.6, 2.7 byte-code decompiler, written in Python 2.7"
HOMEPAGE="https://github.com/Mysterie/uncompyle2"
EGIT_REPO_URI="https://github.com/Mysterie/uncompyle2.git"

LICENSE="GPLv3"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

DEPEND=""
RDEPEND="${DEPEND}"
