# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-misc/xrdp/xrdp-0.4.2.ebuild,v 1.2 2011/06/18 01:41:44 jasiu Exp $

EAPI=4

inherit git-2 eutils autotools

DESCRIPTION="An open source remote desktop protocol(rdp) server."
HOMEPAGE="http://xrdp.sourceforge.net/"
EGIT_REPO_URI="git://github.com/FreeRDP/xrdp.git"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE="debug fuse vnc"

DEPEND="sys-libs/pam"
RDEPEND="${DEPEND}
	fuse? ( app-fs/fuse )
	vnc? ( net-misc/tigervnc[server] )"

pkg_setup() {
	einfo "Creating tsusers and tsadmins groups"
	enewgroup tsusers || die "Creating group tsusers failed"
	enewgroup tsadmins || die "Creating group tsadmins failed"
}

src_prepare() {
	cp ${FILESDIR}/xrdp-sesman-0.7.0.pamd ./instfiles/pam.d/xrdp-sesman
	sed -e 's:/usr/local/sbin:/usr/sbin:' -i ${S}/instfiles/xrdp.sh
	ln -s ../config.c ${S}/sesman/tools/config.c
	eautoreconf
}

src_configure() {
	econf \
		--prefix=/usr \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--enable-freerdpl \
		--enable-jpeg \
		$(use_enable debug xrdpdebug) \
		|| die "econf failed"
}

src_install() {
	sed -i 's/\(AllowRootLogin\)=1/\1=0/' sesman/sesman.ini
	emake DESTDIR="${D}" install || die "install failed"
	newinitd "${FILESDIR}/${PN}-initd" ${PN}
	newconfd "${FILESDIR}/${PN}-confd" ${PN}
}

pkg_postinst() {
	elog
	elog "After installation you must generate a rsa key for xrdp"
	elog "\`xrdp-keygen xrdp auto\`"
	elog
	elog "To be able to login, add users to tsusers group"
	elog "\`gpasswd -a <username> tsusers\`"
	elog
}
