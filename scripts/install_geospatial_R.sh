#!/bin/bash
set -e

# always set this for scripts but don't declare as ENV..
export DEBIAN_FRONTEND=noninteractive

## build ARGs
NCPUS=${NCPUS:--1}

install2.r --error --skipmissing --skipinstalled -n "$NCPUS" \
      gdalUtils \
      ggmap \
      ggvis \
      maps \
      plotKML \
      rasterVis \
      rmapshaper \
      rts

installGithub.r \
      s-u/fastshp \
      ropensci/NLMR \
      ropensci/tiler

# Clean up
rm -rf /var/lib/apt/lists/*
rm -r /tmp/downloaded_packages

## Strip binary installed lybraries from RSPM
## https://github.com/rocker-org/rocker-versioned2/issues/340
strip /usr/local/lib/R/site-library/*/libs/*.so
