#!/bin/bash

## Run this script to (re)install proxygen and its dependencies (fbthrift
## and folly). You must first compile all the dependencies before running this. This
## Usually this is done by first running `deps.sh`.

set -e
start_dir=`pwd`
trap "cd $start_dir" EXIT

# Must execute from the directory containing this script
cd "$(dirname "$0")"

# Install folly
cd folly/folly
make uninstall
make install

# Install proxygen
cd ../..
make uninstall
make install

# Make sure the libraries are available
/sbin/ldconfig
