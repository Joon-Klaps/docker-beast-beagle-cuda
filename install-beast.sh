#!/bin/bash

BEAST_VERSION=''
BROWSER_DOWNLOAD_URL=''
# uncomment when out of pre-release:
wget --quiet ${BROWSER_DOWNLOAD_URL} -O BEAST${BEAST_VERSION}.tgz

tar -xzpf BEAST${BEAST_VERSION}.tgz
rm BEAST${BEAST_VERSION}.tgz

mv BEAST${BEAST_VERSION}/bin/* /usr/local/bin
mv BEAST${BEAST_VERSION}/lib/* /usr/local/lib

beast -beagle_info
