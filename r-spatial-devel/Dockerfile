## Emacs, make this -*- mode: sh; -*-

## start with the Docker 'R-devel' Debian-based image
FROM rocker/r-devel:latest

## maintainer of this script
MAINTAINER Alex Chubaty <alex.chubaty@gmail.com>

## Add binaries for more CRAN packages, deb-src repositories in case we need `apt-get build-dep`
RUN echo 'deb http://debian-r.debian.net/debian-r/ unstable main' >> /etc/apt/sources.list \
  && gpg --keyserver keyserver.ubuntu.com --recv-keys AE05705B842492A68F75D64E01BF7284B26DD379 \
  && gpg --export AE05705B842492A68F75D64E01BF7284B26DD379  | apt-key add - \
  && echo 'deb-src http://debian-r.debian.net/debian-r/ unstable main' >> /etc/apt/sources.list \
  && echo 'deb-src http://http.debian.net/debian testing main' >> /etc/apt/sources.list

## Remain current
RUN apt-get update -qq \
  && apt-get dist-upgrade -y

## additional build dependencies for R spatial packages
RUN apt-get update -qq \
  && apt-get install -y --no-install-recommends \
	bwidget \
	curl/unstable \
	gdal-bin/unstable \
	git \
	gsl-bin \
	krb5-multidev/unstable \
	libgdal-dev/unstable \
	libgdal1h/unstable \
	libgdal1-dev/unstable \
	libgeos-dev/unstable \
	libgeos++-dev/unstable \
	libgsl0-dev \
	libpq-dev/unstable \
	libproj-dev \
	libspatialite-dev/unstable \
	libsqlite3-dev/unstable \
	libssl-dev/unstable \
	libv8-dev \
	libwebp-dev/unstable \
	libwebp5/unstable \
	libxml2-dev/unstable \
	netcdf-bin \
	pandoc \
	qpdf \
        r-cran-rgl \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /var/lib/apt/lists

## install `recommended` so Rdevel can use them
## (Rdevel was installed using `--without-recommended`,
##  so it doesn't 'see' these packages during `R CMD check`)
RUN RDscript -e 'recommended <- unname(installed.packages(priority="recommended")[,"Package"]); install.packages(recommended, lib=.Library, dependencies=TRUE)'
  
## install devtools
RUN RDscript -e 'install.packages("devtools")'

## install additional R spatial packages
RUN xvfb-run RDscript -e 'spatial.pkgs <-  c("geoR", "mapdata", "maps", "maptools", "RandomFields", "plotKML", "rgdal", "rgeos", "shapefiles", "sp", "spatstat", "raster", "rts"); lapply(spatial.pkgs, install.packages)'
RUN RDscript -e 'devtools::install_github("s-u/fastshp")'
