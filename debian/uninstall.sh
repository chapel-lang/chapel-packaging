#!/bin/bash

source config.sh

# Setup variables
configSetup

### Configs ###

cd ${DEBIAN_RELEASE}

# Array variable storing built packages
DEBS=(*.deb)

# Uninstall package (optionally)

DEB_PKGS=""
for DEB in ${DEBS[*]}
do
  BASE=`echo $DEB | cut -f 1 -d _`
  DEB_PKGS="$DEB_PKGS $BASE"
done

echo "Uninstalling $DEB_PKGS"

echo sudo dpkg -r $DEB_PKGS
sudo dpkg -r $DEB_PKGS
