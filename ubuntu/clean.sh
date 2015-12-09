#!/bin/bash

# Remove all files genereated by BTR scripts

source config.sh

configParse "$@"

configSetup

cd $UBUNTU_RELEASE

configClean
