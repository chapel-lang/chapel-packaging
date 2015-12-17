#!/bin/bash

# Building a .deb/.dsc package from the release-source

source config.sh

### Preliminary setup ###

# Argument parsing
configParse "$@"

# Setup variables
configSetup

cd ${UBUNTU_RELEASE}

configClean

### Build the tarballs ###

# Create gzipped tarball from source
tar -cvzf ${ORIG_TARBALL} -C $(dirname ${SRC}) $(basename ${SRC})

# Copy over source for workspace
cp -r ${SRC} ${PKG}

# Move debian directory with custom debian files into source
cp -r ${DEB_SRC} ${PKG}/debian

( cd ${PKG} && dpkg-buildpackage -us -uc )
