## Emacs, make this -*- mode: sh; -*-

## start with the Docker 'r-spatial-devel' Debian-based image
FROM r-spatial-devel:latest

## maintainer of this script
MAINTAINER Alex Chubaty <alex.chubaty@gmail.com>

## Remain current
RUN apt-get update -qq \
	&& apt-get dist-upgrade -y

## additional build dependencies for R spatial packages
RUN apt-get update -qq \
    && apt-get install -y --no-install-recommends \
	curl

## install miniCRAN
RUN RDscript -e 'install.packages("miniCRAN")'

## install `SpaDES` package dependencies
RUN xvfb-run RDscript -e 'spades.deps <- c("data.table", "raster", "knitr", "Matrix", "CircStats", "dplyr", "magrittr", "testthat", "fpCompare", "ggplot2", "httr", "igraph", "RandomFields", "RColorBrewer", "rgdal", "secr", "sp", "tkrplot"); all.deps <- miniCRAN::pkgDep(spades.deps, depends=TRUE, suggests=TRUE, enhances=FALSE); installed <- unname(installed.packages()[,"Package"]); packages <- as.list(all.deps); packages <- packages[-which(packages %in% installed)]; lapply(packages, install.packages)'

## get the current `SpaDES` package build for testing
RUN git clone https://github.com/PredictiveEcology/SpaDES.git &&
	git checkout -b development

CMD ["xvfb-run RDevel"]
