#!/bin/bash

# Kick the tires on the built package, and generate lintian logs

source config.sh

# Setup variables
configSetup

### Configs ###

cd ${DEBIAN_RELEASE}

### Package Quality ###
echo "Generating lintian logs"
lintian ${DEB} > ../cache/deb-lint.log
lintian ${DSC} > ../cache/dsc-lint.log

# Information about package
echo "Generating package information log"
lesspipe ${DEB} > ../cache/pkg-info.log

set -x

# Install package
sudo dpkg -i ${DEB}

which ${BINARY}

${BINARY} --help

ls -R /usr/lib/${PKG}

ls -l /usr/bin/${BINARY}

set +x

echo "Tests finished."

# Uninstall package (optionally)
echo "Uninstall ${PKG}? (ctrl-c to cancel)"
read response

sudo dpkg -r ${PKG}
