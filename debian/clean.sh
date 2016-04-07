#!/bin/bash

# Remove all files genereated by BTR scripts

source config.sh

configSetup

cd ${DEBIAN_RELEASE}

configClean
