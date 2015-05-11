# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2


inherit versionator java-pkg-2 java-ant-2 java-utils-2

DESCRIPTION="A mature Java-based RSS/RDF/Atom Newsreader with advanced features."

HOMEPAGE="http://www.rssowl.org/"
LICENSE="CPL-1.0"

SRC_URI="https://downloads.sourceforge.net/project/${PN}/${PN}%202/$PV/${P}.source.zip"


SLOT="0"
KEYWORDS="*"
IUSE="doc"

#S=${WORKDIR}/${MY_P}
S=${WORKDIR}/
KEYWORDS="*"

DEPEND=">=dev-java/swt-4.2
>=virtual/jdk-1.6.0"

RDEPEND=">=virtual/jre-1.6.0"

src_unpack() {
unpack ${A}
cd ${S}/lib
java-pkg_jar-from swt-4.2
}

EANT_BUILD_TARGET="deploy_linux"

src_install() {
java-pkg_dojar ${PN}.jar

# Create program launcher
java-pkg_dolauncher
echo -e "#!/bin/sh\njava -Djava.library.path=/usr/lib/ -jar /usr/share/${PN}/lib/${PN}.jar" > ./${PN}
dobin ${PN}

insinto /usr/share/icons/hicolor/32x32/apps
newins img/32x32.png rssowl.png

insinto /usr/share/applications/
doins ${FILESDIR}/rssowl.desktop

java-pkg_dohtml -r doc/tutorial/en/*
dodoc doc/{CHANGELOG.txt,LICENSE.txt,README.txt}
}
