#!/bin/bash

# Building a .deb/.dsc package from the release-source
# Most of this script should be handled with uscan / watch file eventually

source config.sh

### Preliminary setup ###

# Setup variables
configSetup

cd ${DEBIAN_RELEASE}

configClean

# Download tarball if tarball not already present
if [ -a ${SRC_TAR} ]; then
    echo "${SRC_TAR} found"
    echo "Using ${SRC_TAR} instead of downloading ${CHPL_RELEASE_URL}"
else
    wget ${CHPL_RELEASE_URL}
fi

# Create package workspace
mkdir -p ${PKG}

#cp ../${SRC_TAR} ${ORIG_TARBALL}
mk-origtargz --copyright-file debian/copyright ${SRC_TAR} -C .

# Untar into workspace
tar -zxf ${ORIG_TARBALL} -C ${PKG} --strip-components 1

# Move debian directory with custom debian files into source
cp -r ${DEB_SRC} ${PKG}/debian

(cd ${PKG} && dpkg-buildpackage  -j4 -us -uc 2>&1 | tee ../logs/build.log)
