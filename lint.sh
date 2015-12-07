#!/bin/bash

# Script to handle changes to ${PKG}-debian files and builds a new package
# Asks to generate a new lintian report if not killed

### Configs ###
source configs.sh

rm -rf ${PKG}/debian
cp -r ${DEB_SRC} ${PKG}/debian
rm -rf ${PKG}/debian/tmp # Temporary
rm -f ${CHANGES}
rm -f ${DEB}
rm -f ${DEB_TAR}
rm -f ${DSC}
rm -rf build-area

( cd ${PKG} && bzr add debian && bzr commit -m "Update debian files" )

( cd ${PKG} && bzr builddeb -- -us -uc )

echo "Generate lintian report? (ctrl-c to cancel)"
read
lintian ${DEB} > lintian.log
