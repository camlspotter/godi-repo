.include "../../mk/bsd.prefs.mk"

VERSION=	0.15.2
ONAME=		cohttp
PKG=		godi-${ONAME}
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	ocaml-cohttp-0.15.2
DISTFILES=	cohttp-0.15.2.tar.xz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITE_BACKUP}
HOMEPAGE=	https://github.com/mirage/ocaml-cohttp
COMMENT=	HTTP library for Lwt, Async and Mirage

BUILD_DEPENDS+=  godi-cmdliner>=0.9.4:../../godi/godi-cmdliner
DEPENDS+=  godi-base64>=2.0.0:../../godi/godi-base64
DEPENDS+=  godi-conduit>=0.7.0:../../godi/godi-conduit
BUILD_DEPENDS+=  godi-ounit-*:../../godi/godi-ounit
BUILD_DEPENDS+=	 godi-findlib-*:../../godi/godi-findlib

DEPENDS+=       godi-bytes>=0:../../godi/godi-bytes
DEPENDS+=	godi-re-*:../../godi/godi-re
DEPENDS+=	godi-fieldslib>=109.20.00:../../godi/godi-fieldslib
DEPENDS+=	godi-uri>=1.5.0:../../godi/godi-uri
DEPENDS+=	godi-sexplib>=109.53.00:../../godi/godi-sexplib
DEPENDS+=	godi-ocaml>=4.01.0:../../godi/godi-ocaml
DEPENDS+= 	godi-lwt>=2.4:../../godi/godi-lwt
DEPENDS+= 	godi-stringext>=0:../../godi-stringext

WINOASIS=		yes

.include "../../mk/bsd.pkg.mk"
