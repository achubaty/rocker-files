FROM rocker/verse:devel

LABEL org.opencontainers.image.licenses="GPL-2.0-or-later" \
      org.opencontainers.image.source="https://github.com/achubaty/rocker-files" \
      org.opencontainers.image.vendor="FOR-CAST Research & Analytics" \
      org.opencontainers.image.authors="achubaty@for-cast.ca"

ADD https://raw.githubusercontent.com/rocker-org/rocker-versioned2/master/scripts/experimental/install_geospatial_unstable.sh /rocker_scripts/experimental/install_geospatial_unstable.sh

RUN chmod +x /rocker_scripts/experimental/install_geospatial_unstable.sh

RUN /rocker_scripts/experimental/install_geospatial_unstable.sh

COPY scripts/* /rocker-files_scripts/

RUN /rocker-files_scripts/install_additional_libs.sh
RUN /rocker-files_scripts/install_geospatial_extras.sh
RUN /rocker-files_scripts/install_geospatial_R.sh

