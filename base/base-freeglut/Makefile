.include "../../mk/bsd.prefs.mk"

PKG=		base-freeglut
PKGNAME=	${PKG}-${VERSION}
VERSION=	2.8.1
RVERSION=	0
PKGREVISION=	0
DISTNAME=	mingw
DISTFILES=	${PKG}_${RVERSION}_${MINGW_WORDSIZE}.tar.xz
CATEGORIES=	base
MASTER_SITES=
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://freeglut.sourceforge.net/
COMMENT=	open source alternative to the OpenGL Utility Toolkit

PLIST_SRC=      ${WRKDIR:Q}/.PLIST.${PKG}

.if !defined(OPSYS) || ${OPSYS} != "CYGWIN"
pre-configure:
	@echo "**********************************************"
	@echo "*** ${PKG} is only intended for Windows ***"
	@echo "**********************************************"
	@false
.endif

do-build:
	@if [ /opt/wodi${MINGW_WORDSIZE:Q} != ${LOCALBASE:QQ} ] && [ -d ${WRKDIR:QQ}/mingw/lib/pkgconfig ]; then \
	  cd ${WRKDIR:QQ}/mingw/lib/pkgconfig && \
	  for f in *.[Pp][Cc] ; do \
	    if [ -n "$$f" ] && [ -f "$$f" ]; then \
	      ${SED} -i -e "s|/opt/wodi${MINGW_WORDSIZE}|${LOCALBASE}|g" "$$f"; \
	    fi \
	  done \
	fi
.if defined(REPLACE_FILES) && ${REPLACE_FILES} != ""
.for file in ${REPLACE_FILES}
	@cd ${WRKDIR:QQ}/mingw &&\
	if [ -n ${file:QQ} ] && [ /opt/wodi${MINGW_WORDSIZE:Q} != ${LOCALBASE:QQ} ] && [ -f ${file:QQ} ]; then\
	  ${SED} -i -e "s|/opt/wodi${MINGW_WORDSIZE}|${LOCALBASE}|g" ${file:QQ}; \
	fi
.endfor
.endif


do-install:
	@cd ${WRKSRC} && ${FIND} * ! -type d >${PLIST_SRC} \
	 && ${PAX} -rw -pp . ${LOCALBASE:Q}


.include "../../mk/bsd.pkg.mk"
