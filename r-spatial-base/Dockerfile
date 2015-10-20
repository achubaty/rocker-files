## Emacs, make this -*- mode: sh; -*-

## start with the Docker 'R-base' Debian-based image
FROM rocker/r-base:latest

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
RUN apt-get install -y --no-install-recommends -t unstable \
	bwidget \
	ca-certificates \
	curl \
	gdal-bin \
	git \
	gsl-bin \
	libcurl4-openssl-dev \
#	libgdal1h \
	libgdal1-dev \
	libgeos-dev \
	libgeos++-dev \
	libgsl0-dev \
	libproj-dev \
	libspatialite-dev \
	libv8-dev \
	libxml2-dev \
	netcdf-bin \
	pandoc \
	qpdf \
	r-cran-rgl \
	r-cran-tkrplot \
	xauth \
	xfonts-base \
	xvfb \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /var/lib/apt/lists

## install devtools
RUN Rscript -e 'install.packages("devtools")'

## install R spatial packages
RUN xvfb-run Rscript -e 'install.packages( c("geoR", "ggvis", "mapdata", "maps", "maptools", "RandomFields", "plotKML", "rgdal", "rgeos", "shapefiles", "sp", "spatstat", "raster", "rasterVis", "rts") )'
RUN Rscript -e 'devtools::install_github("s-u/fastshp")'
