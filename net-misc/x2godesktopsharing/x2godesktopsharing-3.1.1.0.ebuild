# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit qt4-r2

DESCRIPTION="The X2Go desktop sharing utility"
HOMEPAGE="http://www.x2go.org"
SRC_URI="http://code.x2go.org/releases/source/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~*"
IUSE=""
#IUSE="linguas_da linguas_de linguas_es linguas_fr linguas_nb_NO linguas_nl linguas_ru linguas_sv linguas_zh_TW"

DEPEND="virtual/man
	dev-qt/qtgui:4
	dev-qt/qtsvg:4"
RDEPEND="${DEPEND}
	>=net-misc/x2goserver-4.0.1"

pkg_setup() {
	enewgroup x2godesktopsharing
}

src_install() {
	insinto /usr/bin
	dobin x2godesktopsharing || die
	dobin bin/x2goresume-desktopsharing || die
	dobin bin/x2gosuspend-desktopsharing || die
	dobin bin/x2goterminate-desktopsharing || die

	insinto /usr/share/applications
	doins x2godesktopsharing.desktop || die

	insinto /usr/share/x2godesktopsharing/icons
	doins icons/x2godesktopsharing.xpm || die

	for size in "16x16" "22x22" "32x32" "64x64" "128x128"
	do
		insinto /usr/share/icons/hicolor/$size/apps
		doins icons/$size/x2godesktopsharing.png || die
	done

	insinto /usr/share/x2go/x2gofeature.d
	doins share/x2gofeature.d/x2godesktopsharing.features

	doman man/man1/x2godesktopsharing.1 || die
	doman man/man8/x2goresume-desktopsharing.8 || die
	doman man/man8/x2gosuspend-desktopsharing.8 || die
	doman man/man8/x2goterminate-desktopsharing.8 || die

	dodoc debian/changelog || die
	dodoc debian/copyright || die
}

pkg_postinst() {
	einfo
	einfo "To be able to use x2godesktop, add the user to x2godesktopsharing group:"
	einfo
	einfo "gpasswd -a <user> x2godesktopsharing"
	einfo
}
