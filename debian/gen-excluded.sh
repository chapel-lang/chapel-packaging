#!/bin/bash

# Generates a Files-excluded line
# 


source config.sh

# Setup variables
configSetup

MYTMPDIR=/tmp/chpl-gen-excluded

mkdir -p ${MYTMPDIR}

tar -zxf cache/${SRC_TAR} -C ${MYTMPDIR} --strip-components 1

echo "Files-Excluded: "doc/html
echo "                "util/chplenv/template
 
# Turn on extended globbing (used below)
shopt -s extglob
# Make globs without match be zero words instead of the glob pattern
shopt -s nullglob

pushd ${MYTMPDIR} > /dev/null
for dir in third-party/!(utf8-decoder)
do
  for exclude in ${dir}/!(Makefile*|README*) 
  do
    echo "                "${exclude}
  done
done
echo
popd > /dev/null

