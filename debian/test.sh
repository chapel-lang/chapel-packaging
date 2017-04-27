#!/bin/bash

# Kick the tires on the built package, and generate lintian logs

source config.sh

# Setup variables
configSetup

### Configs ###

cd ${DEBIAN_RELEASE}

# Array variable storing built packages
DEBS=(*.deb)

### Package Quality ###
echo "Generating lintian logs"
LINTFLAGS="-I --show-overrides"

echo
echo lintian ${LINTFLAGS} ${DSC}
rm -f ../cache/dsc-lint.log
lintian ${LINTFLAGS} ${DSC} | tee ../cache/dsc-lint.log

echo
echo lintian ${LINTFLAGS} ${CHANGES}
rm -f ../cache/changes-lint.log
lintian ${LINTFLAGS} ${CHANGES} | tee ../cache/changes-lint.log

for DEB in ${DEBS[*]}
do
  BASE=`echo $DEB | cut -f 1 -d _`
  echo
  echo lintian ${LINTFLAGS} ${DEB}
  rm -f ../cache/${BASE}-lint.log
  lintian ${LINTFLAGS} ${DEB} | tee ../cache/${BASE}-lint.log
done

echo

for DEB in ${DEBS[*]}
do
  BASE=`echo $DEB | cut -f 1 -d _`
  echo
 
  # Information about package
  echo "Generating package information log for ${DEB}"
  echo lesspipe ${DEB}
  lesspipe ${DEB} > ../cache/${BASE}-pkg-info.log

done

#set -x

# Install package
sudo dpkg -i ${DEBS[*]}

which ${BINARY}

${BINARY} --version

echo "Summarizing Package contents:"
ls -R /usr/share/chapel /usr/lib/chapel > ../cache/pkg-contents.log

ls -l /usr/bin/${BINARY} >> ../cache/pkg-contents.log

echo "Tests finished."

# Uninstall package (optionally)

DEB_PKGS=""
for DEB in ${DEBS[*]}
do
  BASE=`echo $DEB | cut -f 1 -d _`
  DEB_PKGS="$DEB_PKGS $BASE"
done

echo "Uninstall $DEB_PKGS? (ctrl-c to cancel)"
read response

echo sudo dpkg -r $DEB_PKGS
sudo dpkg -r $DEB_PKGS
