#!/bin/bash

# Initialization script (if the repository was just cloned)

GIT_CHPL=git@github.com:chapel-lang/chapel.git

# Clone into chapel-source directory
rm -rf chapel-source
git clone ${GIT_CHPL} chapel-source
