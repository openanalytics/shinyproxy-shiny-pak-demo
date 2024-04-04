FROM openanalytics/r-ver:4.3.3

RUN /rocker_scripts/setup_R.sh https://packagemanager.posit.co/cran/__linux__/jammy/latest
RUN echo "\noptions(shiny.port=3838, shiny.host='0.0.0.0')" >> /usr/local/lib/R/etc/Rprofile.site

# system libraries of general use
RUN apt-get update && apt-get install --no-install-recommends -y \
    pandoc \
    pandoc-citeproc \
    libcairo2-dev \
    libxt-dev \
    && rm -rf /var/lib/apt/lists/*

# system library dependency for the euler app
RUN apt-get update && apt-get install --no-install-recommends -y \
    libmpfr-dev \
    && rm -rf /var/lib/apt/lists/*

RUN R -q -e 'install.packages("pak")'
RUN R -q -e 'pak::pkg_install(c("shiny", "Rmpfr"))'

# install R code
COPY euler /build/euler
RUN R CMD INSTALL /build/euler

EXPOSE 3838

CMD ["R", "-q", "-e", "euler::runShiny()"]
