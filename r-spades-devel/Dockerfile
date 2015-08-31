## Emacs, make this -*- mode: sh; -*-

## start with the Docker 'r-spatial-devel' Debian-based image
FROM achubaty/r-spatial-devel:latest

## maintainer of this script
MAINTAINER Alex Chubaty <alex.chubaty@gmail.com>

## Remain current
RUN apt-get update -qq \
  && apt-get dist-upgrade -y

## get the current `SpaDES` package build for testing
RUN git clone https://github.com/PredictiveEcology/SpaDES.git \
  && cd SpaDES \
  && git checkout development

## install `SpaDES` package dependencies
RUN cd SpaDES \
  && xvfb-run RDscript -e 'tryCatch({ deps <- devtools::install_deps(dependencies = TRUE) }, error = function(e) { message(e); q(status=1) }); if (!all(deps %in% installed.packages())) { message("missing: ", paste(setdiff(deps, installed.packages()), collapse=", "));  q(status = 1, save = "no") }'
RUN RDscript -e 'devtools::install_github("jimhester/covr")' # `fastshp` already installed
