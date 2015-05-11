# Distributed under the terms of the GNU General Public License v2
# updated for funtoo

DESCRIPTION="Compiz Fusion (meta)"
HOMEPAGE="http://www.compiz.org/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="*"
IUSE="emerald gnome kde unsupported"

RDEPEND="
	>=x11-wm/compiz-${PV}
	>=x11-plugins/compiz-plugins-main-${PV}
	>=x11-plugins/compiz-plugins-extra-${PV}
	unsupported? ( >=x11-plugins/compiz-plugins-unsupported-${PV} )
	>=x11-apps/ccsm-0.8.4
	>=x11-apps/fusion-icon-0.1-r2
	emerald? ( >=x11-wm/emerald-${PV} >=x11-themes/emerald-themes-0.5.2 )
	gnome? ( >=x11-libs/compizconfig-backend-gconf-${PV} )
	kde? ( >=x11-libs/compizconfig-backend-kconfig4-${PV} )"

pkg_postinst() {
	ewarn "If you want to try out simple-ccsm, you'll need to emerge it"
	ewarn "If you want to use emerald, set the emerald use flag"
}
