# Distributed under the terms of the GNU General Public License v2

EAPI=4

SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="*"

inherit distutils python

DESCRIPTION="DropBox SDK for Python"
HOMEPAGE="https://www.dropbox.com/developers/core/sdks/python"
SRC_URI="https://www.dropbox.com/developers/downloads/sdks/core/python/${P}.zip"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

