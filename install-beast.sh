#!/bin/bash

BEAST_VERSION='v10.5.0'
BROWSER_DOWNLOAD_URL='https://github.com/beast-dev/beast-mcmc/releases/download/v10.5.0/BEAST_X_v10.5.0.tgz'
# uncomment when out of pre-release:
wget --quiet ${BROWSER_DOWNLOAD_URL} -O BEAST${BEAST_VERSION}.tgz

tar -xzpf BEAST${BEAST_VERSION}.tgz
rm BEAST${BEAST_VERSION}.tgz

# Names could change across versions, but should alls start with BEAST
extracted_dir=$(ls -d BEAST*)
mv ${extracted_dir} BEAST${BEAST_VERSION}

mv BEAST${BEAST_VERSION}/bin/* /usr/local/bin
mv BEAST${BEAST_VERSION}/lib/* /usr/local/lib

beast -beagle_info
