## Emacs, make this -*- mode: sh; -*-

## start with the Docker 'r-spatial-devel' Debian-based image
FROM achubaty/r-spatial-devel:latest

## maintainer of this script
MAINTAINER Alex Chubaty <alex.chubaty@gmail.com>

## Remain current
RUN apt-get update -qq \
  && apt-get dist-upgrade -y

## install miniCRAN
RUN RDscript -e 'install.packages("miniCRAN")'

## install `SpaDES` package dependencies
RUN xvfb-run --auto-servernum RDscript -e 'spades.deps <- c("data.table", "raster", "knitr", "Matrix", "CircStats", "dplyr", "magrittr", "testthat", "downloader", "fpCompare", "ggplot2", "gridBase", "httr", "igraph", "RandomFields", "RColorBrewer", "rgdal", "secr", "sp", "tkrplot"); all.deps <- miniCRAN::pkgDep(spades.deps, depends=TRUE, suggests=FALSE, enhances=FALSE); installed <- unname(installed.packages()[,"Package"]); packages <- as.list(all.deps); packages <- packages[-which(packages %in% installed)]; lapply(packages, install.packages)'

## get the current `SpaDES` package build for testing
RUN git clone https://github.com/PredictiveEcology/SpaDES.git \
  && cd SpaDES \
  && git checkout -b development
