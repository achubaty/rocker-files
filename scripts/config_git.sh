#!/bin/bash
set -e

# always set this for scripts but don't declare as ENV..
export DEBIAN_FRONTEND=noninteractive

git config --global url.ssh://git@github.com/.insteadOf https://github.com/

