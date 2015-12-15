# Notes on changes to default debian files

### examples ###
    rm -f *ex *EX

### changelog ###
# Replace unstable with ${UBUNTU_CODENAME}
# Put ${UBUNTU_RELEASE} somewhere...

### control ###
# Copy custom control in (too much to modify)
# TODO: Description, Build-Depends, Homepage,

### copyright ###
# License of upstream source

### docs ###
# Upstream docs

### README.* ###
# Remove em all (necessary for nonstandard features)
#    rm -f README.source README.Debian

### rules ###
# Makefile to compile code into binary package
