# Print help
configHelp() {
    echo;
    echo "This script builds the rpm for a given Debian release"
    echo "It expects \$CHPL_RELEASE to be defined and \$DEBIAN_RELEASE to be"
    echo "defined or provided as command line argument"
    echo;
    echo "   ./<script> <release>"
    echo;
}


# Setup all the common variables and confirm inputs are defined
configSetup() {

    echo ""

    # Package specific
    PKG=chapel-minimal
    BINARY=chpl
    VERSION=1.15.0

    # This variable is always read as an environment variable
    if [ -z ${CHPL_RELEASE_URL} ]; then
        echo "\$CHPL_RELEASE_URL undefined; Setting \$CHPL_RELEASE_URL to:"
        CHPL_RELEASE_URL=https://github.com/chapel-lang/chapel/releases/download/${VERSION}/chapel-${VERSION}.tar.gz
        echo "${CHPL_RELEASE_URL}"
        echo ""
        export CHPL_RELEASE_URL
    fi

    # This variable can be read as env var or passed as argument
    if [ -z ${DEBIAN_RELEASE} ]; then
        echo "\$DEBIAN_RELEASE undefined; Setting \$DEBIAN_RELEASE to:"
        #DEBIAN_RELEASE=`lsb_release -a 2> /dev/null | grep Codename | awk '{print $2}'`
        DEBIAN_RELEASE=sid
        echo "${DEBIAN_RELEASE}"
        echo ""
        export DEBIAN_RELEASE
    fi

    # Machine specific (generated dynamically)
    DEBIAN=1
    ARCH=amd64

    TARBALL=${PKG}-${VERSION}.tar.gz
    ORIG_TARBALL=${PKG}_${VERSION}.orig.tar.gz

    # Directories
    SRC_TAR=$(basename ${CHPL_RELEASE_URL})
    SRC=$(basename ${CHPL_RELEASE_URL} | cut -f 1,2,3 -d '.')
    DEB_SRC=debian

    # Package Files
    BASENAME=${PKG}_${VERSION}-${DEBIAN}

    CHANGES=${BASENAME}_${ARCH}.changes
    DEB=${BASENAME}_${ARCH}.deb
    DEB_TAR_GZ=${BASENAME}.debian.tar.gz
    DEB_TAR_XZ=${BASENAME}.debian.tar.xz
    DSC=${BASENAME}.dsc
}

# Clean up everything except 'debian' directory
configClean() {
    find . | grep -v "debian" | xargs rm -rf
}
