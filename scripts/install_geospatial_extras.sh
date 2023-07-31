#!/bin/bash
set -e

# always set this for scripts but don't declare as ENV..
export DEBIAN_FRONTEND=noninteractive

# a function to install apt packages only if they are not installed
function apt_install() {
    if ! dpkg -s "$@" >/dev/null 2>&1; then
        if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
            apt-get update
        fi
        apt-get install -y --no-install-recommends "$@"
    fi
}

# install nodejs + mapshaper
apt-get remove -y libnode-dev
curl -sL https://deb.nodesource.com/setup_20.x | sudo -E bash -
apt_install nodejs
npm install npm@latest -g
npm install -g mapshaper

# Clean up
rm -rf /var/lib/apt/lists/*

