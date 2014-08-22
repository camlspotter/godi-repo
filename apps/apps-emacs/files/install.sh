#!/bin/bash

set -e
set -u

SCRIPT_DIR="$(dirname "$0")"

cd "${SCRIPT_DIR}"

chmod 0755 opt/emacs/bin/*.exe
EMACS="$(readlink -f opt/emacs/bin)"
export PATH="${EMACS}:${PATH}"
EMACS="${EMACS}/emacs.exe"
cp -a tuareg-* opt/emacs/site-lisp/tuareg
cp -a color-theme-* opt/emacs/site-lisp/color-theme
cp -a auto-complete-* opt/emacs/site-lisp/auto-complete
cp site-start.el opt/emacs/site-lisp
mkdir -p opt/emacs/site-lisp/cygwin
cp cygwin-mount.el opt/emacs/site-lisp/cygwin
cp -a ocaml/emacs opt/emacs/site-lisp/caml
cp omake.el opt/emacs/site-lisp

batch_compile(){
    if [ ! -f "$1" ] || [ -z "$1" ]; then
	return
    fi
    if "$EMACS" -nw -batch -f batch-byte-compile "$1" ; then
        if [ -f "${1}c" ]; then
            gzip -9 "$1"
        fi
    fi
}

cd yasnippet-*
for f in *.el ; do
    batch_compile "$f"
done
rm -f ChangeLog README
mv * ../company-*
cd ../company-*
batch_compile "cl-lib.el"
make compile
for f in *.el ; do
    if [ -f "$f" ] && [ -f "${f}c" ]; then
        gzip -9 "$f"
    fi
done
rm -f ChangeLog Makefile *.md .git* .*.yml .*.el
rm -rf snippets/ruby-mode # broken, space in path!
cd ..
cp -a company-* opt/emacs/site-lisp/company 

cd opt/emacs/site-lisp

batch_compile omake.el
for d in caml cygwin tuareg auto-complete color-theme color-theme/themes ; do
    cd "$d"
    for f in *.el ; do
        batch_compile "$f"
    done
    cd ~-
done
