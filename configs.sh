# User specific
LPUSERNAME=balbrecht
# PPA=TODO

# Package specific
PKG=chapel
BINARY=chpl
VERSION=1.13

# Machine specific (generated dynamically)
UBUNTU=0ubuntu1
ARCH=amd64

TARBALL=${PKG}-${VERSION}.tar.gz
ORIG_TARBALL=${PKG}_${VERSION}.orig.tar.gz

# Directories
SRC=${PKG}-source
DEB_SRC=${PKG}-debian

# Package Files
BASENAME=${PKG}_${VERSION}-${UBUNTU}

CHANGES=${BASENAME}_${ARCH}.changes
DEB=${BASENAME}_${ARCH}.deb
DEB_TAR=${BASENAME}.debian.tar.gz
DSC=${BASENAME}.dsc
