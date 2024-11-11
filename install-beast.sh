#!/bin/bash

BEAST_VERSION='1.10.5pre_thorney_0.1.2'
BROWSER_DOWNLOAD_URL='https://github.com/beast-dev/beast-mcmc/releases/download/v1.10.5pre_thorney_v0.1.2/BEASTv1.10.5pre_thorney_0.1.2.tgz'
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
