## Emacs, make this -*- mode: sh; -*-

## start with the Docker 'R-devel' Debian-based image
FROM rocker/r-devel:latest

## maintainer of this script
MAINTAINER Alex Chubaty <alex.chubaty@gmail.com>

## Remain current
RUN apt-get update -qq \
	&& apt-get dist-upgrade -y

## additional build dependencies for R spatial packages
RUN apt-get update -qq \
&& apt-get install -y --no-install-recommends \
	bwidget \
	gsl-bin \
	libgdal-dev \
	libgdal1-dev \
	libgeos-dev \
	libgeos++-dev \
	libgsl0-dev \
	libproj-dev \
	libspatialite-dev \
	libxml2-dev \
	netcdf-bin \
	xauth \
	xfonts-base \
	xvfb \
&& apt-get build-dep -y r-cran-rgl

## install devtools
RUN RDscript -e 'install.packages("devtools")'

## install additional R spatial packages
RUN xvfb-run RDscript -e 'spatial.pkgs <-  c("geoR", "mapdata", "maps", "maptools", "RandomFields", "plotKML", "rgdal", "rgeos", "shapefiles", "sp", "spatstat", "raster", "rts"); lapply(spatial.pkgs, install.packages)'
RUN RDscript -e 'devtools::install_github("s-u/fastshp")'
