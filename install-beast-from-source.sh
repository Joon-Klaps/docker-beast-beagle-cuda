#!/bin/bash
# This script is intended to install BEAST from the master branch
set -e -o pipefail

git clone https://github.com/beast-dev/beast-mcmc.git

cd beast-mcmc

# Build BEAST
ant dist

# Create necessary directories in /usr/local
mkdir -p /usr/local/lib
mkdir -p /usr/local/plugins

# Copy the jar files to /usr/local/lib
cp build/dist/beast.jar /usr/local/lib/
cp -r lib/* /usr/local/lib/ 2>/dev/null || true

# Copy any plugin jars to /usr/local/plugins
if [ -d "build/dist/plugins" ]; then
    cp -r build/dist/plugins/* /usr/local/plugins/ 2>/dev/null || true
fi

# Clean up
cd ..
rm -rf beast-mcmc

echo "BEAST installed successfully"