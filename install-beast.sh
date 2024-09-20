#!/bin/bash

git clone https://github.com/beast-dev/beast-mcmc.git --branch hmc_develop --single-branch beast-mcmc
cd beast-mcmc
ant dist

cd ..
mv beast-mcmc/bin/* /usr/local/bin
mv beast-mcmc/lib/* /usr/local/lib

beast -beagle_info
