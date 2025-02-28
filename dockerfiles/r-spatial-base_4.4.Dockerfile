FROM rocker/geospatial:4.4.3

LABEL org.opencontainers.image.licenses="GPL-2.0-or-later" \
      org.opencontainers.image.source="https://github.com/achubaty/rocker-files" \
      org.opencontainers.image.vendor="FOR-CAST Research & Analytics" \
      org.opencontainers.image.authors="achubaty@for-cast.ca"

COPY scripts/* /rocker-files_scripts/

RUN /rocker-files_scripts/install_additional_libs.sh
RUN /rocker-files_scripts/install_geospatial_extras.sh
RUN /rocker-files_scripts/install_geospatial_R.sh

