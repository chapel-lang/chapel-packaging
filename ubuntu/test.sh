#!/bin/bash

# Kick the tires on the built package, and generate lintian logs

source config.sh

configParse "$@"

configSetup

### Configs ###

cd $UBUNTU_RELEASE

### Package Quality ###
echo "Generating lintian logs"
lintian ${DEB} > deb-lint.log 
lintian ${DSC} > dsc-lint.log

# Information about package
lesspipe ${DEB}

# Install package
sudo dpkg -i ${DEB}

which ${BINARY}

${BINARY} --help

ls -R /usr/lib/${PKG}

ls -l /usr/bin/${BINARY}

# TODO - more testing: Compile Chapel code, pbuilder
echo "Test successful."

# Uninstall package (optionally)
echo "Uninstall ${PKG}? (ctrl-c to cancel)"
read response

sudo dpkg -r ${PKG}
