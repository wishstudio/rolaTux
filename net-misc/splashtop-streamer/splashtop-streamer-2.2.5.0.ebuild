# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit unpacker

DESCRIPTION="Splashtop Streamer is a high-performance audio-video streaming server."
HOMEPAGE="http://www.splashtop.com"
SRC_URI="Splashtop_Streamer_Ubuntu_1204_v${PV}_amd64.deb"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=dev-libs/apr-1.2.7
	>=dev-libs/apr-util-1.2.7
	>=sys-apps/dbus-1.0.2
	>=dev-libs/dbus-glib-0.78
	>=dev-libs/glib-0.12.0
	dev-libs/openssl
	>=sys-apps/util-linux-2.16
	x11-libs/libXfixes
	x11-libs/libX11
	x11-libs/libXtst
	>=x11-libs/libXrandr-1.2.0
	media-sound/pulseaudio
	=media-libs/x264-0.0.20111220
	dev-python/pygtk
	>=dev-python/pycrypto-2.4.1
	>=dev-python/pywebkitgtk-1.1.8"
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_install() {
	doins -r ${S}/opt || die "install failed"
	doins -r ${S}/usr || die "install failed"
}
