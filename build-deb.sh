#!/bin/bash

# Here is my attempt to automate building a .deb package from the source

### Configs ###
source configs.sh

### Preliminary setup ###

# Create gzipped tarball from source
rm -f ${TARBALL}
tar -cvzf ${TARBALL} ${SRC}

# Generate template via bzr
rm -f ${ORIG_TARBALL}
( cd ${PKG} && bzr remove-branch --force . )
rm -rf ${PKG}
bzr dh-make ${PKG} ${VERSION} ${TARBALL} <<EOD
s

EOD

### debian files ###
# Overwrite generated debian directory with custom debian files
rm -rf ${PKG}/debian
#( cd ${PKG} &&  bzr revert )
cp -r ${DEB_SRC} ${PKG}/debian
rm -rf ${PKG}/debian/tmp # Temporary

# Pre-clean
rm -f ${CHANGES}
rm -f ${DEB}
rm -f ${DEB_TAR}
rm -f ${DSC}
rm -rf build-area


### Bazaar & Build ###
# Generate debian files to repository
( cd ${PKG} && bzr add debian && bzr commit -m "Initial commit of Debian Packaging" )

# Build package!
( cd ${PKG} && bzr builddeb -- -us -uc )

### Information about package ###
#lesspipe ${DEB}
