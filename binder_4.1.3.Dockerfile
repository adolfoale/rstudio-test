FROM rocker/geospatial:4.1.3
#FROM adolfoale/rstudio:geospatial_4.1.3

LABEL org.opencontainers.image.licenses="GPL-2.0-or-later" \
      org.opencontainers.image.source="https://github.com/rocker-org/rocker-versioned2" \
      org.opencontainers.image.vendor="Rocker Project" \
      org.opencontainers.image.authors="Carl Boettiger <cboettig@ropensci.org>"

ENV NB_USER=rstudio

COPY install_pyenv.sh /rocker_scripts/

RUN chmod +x /rocker_scripts/install_pyenv.sh

RUN /rocker_scripts/install_python.sh
RUN /rocker_scripts/install_binder.sh

EXPOSE 8888

CMD jupyter notebook --ip 0.0.0.0

USER ${NB_USER}

WORKDIR /home/${NB_USER}
