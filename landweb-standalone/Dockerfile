## Emacs, make this -*- mode: sh; -*-

## start with the Docker 'R-base' Debian-based image
FROM achubaty/spades-project

## maintainer of this script
MAINTAINER Alex Chubaty <achubaty@for-cast.ca>

## install additional R packages && cleanup
ARG GITHUB_PAT=$GITHUB_PAT
RUN xvfb-run -a /usr/local/bin/installGithub.r "PredictiveEcology/LandWebUtils@development" \
  && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

## clone LandWeb project into 'rstudio' user's home directory
RUN mkdir /home/rstudio/GitHub \
  && cd /home/rstudio/GitHub \
  && git clone --single-branch -b development --recurse-submodules="." \
      --recurse-submodules=":(exclude)app" \
      --recurse-submodules=":(exclude)deploy" \
      -j8 https://github.com/PredictiveEcology/LandWeb \
  && chown -R rstudio:rstudio /home/rstudio/GitHub

