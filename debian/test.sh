#!/bin/bash

# Kick the tires on the built package, and generate lintian logs

source config.sh

# Setup variables
configSetup

### Configs ###

cd ${DEBIAN_RELEASE}

### Package Quality ###
echo "Generating lintian logs"
LINTFLAGS="-I --show-overrides"
lintian ${LINTFLAGS} ${DEB} > ../cache/deb-lint.log
lintian ${LINTFLAGS} ${DSC} > ../cache/dsc-lint.log
lintian ${LINTFLAGS} ${CHANGES} > ../cache/changes-lint.log

# Information about package
echo "Generating package information log"
lesspipe ${DEB} > ../cache/pkg-info.log

set -x

# Install package
sudo dpkg -i ${DEB}

which ${BINARY}

${BINARY} --version

echo "Package contents:"
ls -R /usr/lib/chapel > ../cache/pkg-contents.log

ls -l /usr/bin/${BINARY} >> ../cache/pkg-contents.log

set +x

echo "Tests finished."

# Uninstall package (optionally)
echo "Uninstall ${PKG}? (ctrl-c to cancel)"
read response

sudo dpkg -r ${PKG}
