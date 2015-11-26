#!/bin/bash

# Here is my attempt to kick the tires on a built dsc/deb package

### Configs ###
source configs.sh

set -x

# Information about package
lesspipe ${DEB}

# Install package
sudo dpkg -i ${DEB}

which ${BINARY}

${BINARY} --help

ls -R /usr/lib/${PKG}

ls -R /usr/bin/${PKG}

# testing..
echo "Uninstall ${PKG}? (ctrl-c to cancel)"
read response

sudo dpkg -r ${PKG}

### Package Quality ###

# check package quality with linitian:
# lintian ${PKG}_${VERSION}-0ubuntu1.dsc
# lintian ${PKG}_${VERSION}-0ubuntu1_amd64.deb

# After fixing changes, rebuild without cleaning
# bzr builddeb -- -nc -us -us

### Installing package locally ###

# bzr builddeb -S
# cd ../build-area
# pbuilder-dist ${UBUNTU_CODENAME} build ${DSC}

# Upload branch to Launchpad for review
# bzr push lp:~${LPUSERNAME}/+junk/hello-package

# Setup PPA in Launchpad and upload with dput:
# dput ppa:${LPUSERNAME}/${PPA} ${CHANGES}

