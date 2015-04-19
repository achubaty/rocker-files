## Emacs, make this -*- mode: sh; -*-

## start with the Docker 'R-base' Debian-based image
FROM rocker/r-base:latest

## maintainer of this script
MAINTAINER Alex Chubaty <alex.chubaty@gmail.com>

## Remain current
RUN apt-get update -qq \
	&& apt-get dist-upgrade -y

## additional build dependencies for R spatial packages
RUN apt-get update -qq \
    && apt-get install -y --no-install-recommends \
		bwidget \
		curl \
		git \
		gsl-bin \
		libcurl4-openssl-dev \
		libgdal-dev \
		libgdal1-dev \
		libgeos-dev \
		libgeos++-dev \
		libgsl0-dev \
		libproj-dev \
		libspatialite-dev \
		libxml2-dev \
		netcdf-bin \
		r-cran-rgl \
		xauth \
		xfonts-base \
		xvfb

## install devtools
RUN Rscript -e 'install.packages("devtools")'

## install additional R spatial packages
RUN xvfb-run Rscript -e 'spatial.pkgs <-  c("geoR", "mapdata", "maps", "maptools", "RandomFields", "plotKML", "rgdal", "rgeos", "shapefiles", "sp", "spatstat", "raster", "rts"); lapply(spatial.pkgs, install.packages)'
RUN Rscript -e 'devtools::install_github("s-u/fastshp")'
