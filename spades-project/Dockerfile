## Emacs, make this -*- mode: sh; -*-

## start with the Docker 'R-base' Debian-based image
#FROM rocker/geospatial:4.0.2
FROM rocker/geospatial:4.0.0-ubuntu18.04

## maintainer of this script
MAINTAINER Alex Chubaty <achubaty@for-cast.ca>

## use Rstudio package binaries
ENV CRAN=https://packagemanager.rstudio.com/all/__linux__/bionic/latest

## Remain current
RUN apt-get update -qq \
  && apt-get dist-upgrade -y

## additional build dependencies for various R packages
RUN apt-get install -y --no-install-recommends \
    bwidget \
    gnupg \
    gsl-bin \
    libgmp-dev \
    libprotoc-dev \
    pandoc pandoc-citeproc \
    python-gdal \
    python3-gdal \
    xauth \
    xfonts-base \
    xvfb

## nodejs
RUN curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
RUN sudo apt-get install -y nodejs
RUN npm install npm@latest -g
RUN npm install -g mapshaper

RUN apt-get autoremove -qy \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /var/lib/apt/lists

## config
RUN echo 'R_REMOTES_STANDALONE=true' >> /home/rstudio/.Renviron

## install devtools
RUN xvfb-run -a install2.r config devtools logging remotes rgl rJava tkrplot

## install R spatial packages && cleanup
ARG GITHUB_PAT=$GITHUB_PAT
RUN xvfb-run -a /usr/local/bin/installGithub.r s-u/fastshp \
  && xvfb-run -a /usr/local/bin/installGithub.r "PredictiveEcology/quickPlot@development" \
  && xvfb-run -a /usr/local/bin/installGithub.r "PredictiveEcology/Require@development" \
  && xvfb-run -a /usr/local/bin/installGithub.r "PredictiveEcology/reproducible@development" \
  && xvfb-run -a /usr/local/bin/installGithub.r "PredictiveEcology/SpaDES.core@development" \
  && xvfb-run -a /usr/local/bin/installGithub.r "PredictiveEcology/SpaDES.tools@development" \
  && xvfb-run -a /usr/local/bin/installGithub.r "PredictiveEcology/SpaDES.addins@development" \
  && xvfb-run -a /usr/local/bin/installGithub.r "achubaty/amc@development" \
  && rm -rf /tmp/downloaded_packages/ /tmp/*.rds
