#!/bin/bash

# Clean shit up

### Configs ###
source configs.sh

### Preliminary setup ###

# Create gzipped tarball from source
rm -f ${TARBALL}

# Generate template via bzr
rm -f ${ORIG_TARBALL}
rm -rf ${PKG}

### debian files ###
rm -rf ${PKG}/debian

# Clean package files
rm -f ${CHANGES}
rm -f ${DEB}
rm -f ${DEB_TAR}
rm -f ${DSC}
rm -rf build-area
