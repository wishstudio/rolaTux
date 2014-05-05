# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit git-2

DESCRIPTION="A general purpose, text oriented editor."
HOMEPAGE="http://howl.io"
EGIT_REPO_URI="git://github.com/nilnor/howl.git"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="x11-libs/gtk+:3"
DEPEND="${RDEPEND}
	net-misc/wget"

src_compile() {
	cd src
	emake || die "emake failed."
}

src_install() {
	cd src
	make PREFIX=${D}/usr install
}
