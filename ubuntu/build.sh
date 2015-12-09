#!/bin/bash

# Building a .deb/.dsc package from the release-source


source config.sh


### Preliminary setup ###

# Argument parsing
configParse "$@"

# Setup variables
configSetup


cd ${UBUNTU_RELEASE}


### Build the tarballs ###

# Create gzipped tarball from source
rm -f ${TARBALL}
tar -cvzf ${TARBALL} -C $(dirname ${SRC}) $(basename ${SRC})

# Generate template via bzr
rm -f ${ORIG_TARBALL}

# Double check 'rm -rf ${VAR}' (could cost you your life (or home directory))
if [ -z ${PKG} ]; then
    echo "Critical Error: \${PKG} is not defined"
    exit 1
fi

if [ -d "${PKG}" ]; then
    ( cd ${PKG} && bzr remove-branch --force . )
    rm -rf ${PKG}
fi

bzr dh-make ${PKG} ${VERSION} ${TARBALL} <<EOD
s

EOD


### ${PKG}/debian files ###
# Overwrite generated debian directory with custom debian files
rm -rf ${PKG}/debian
cp -r ${DEB_SRC} ${PKG}/debian

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
