FROM openanalytics/r-ver:4.3.2

RUN apt-get update && apt-get install -y --no-install-recommends \
	liblzma-dev \
	libbz2-dev \
	libxt6

RUN R -q -e 'install.packages("pak")'
RUN R -q -e 'pak::pkg_install(c("GenomicRanges", "Gviz", "shiny"))'

# copy necessary files
COPY Rprofile.site /usr/lib/R/etc/
## app folder
COPY /shinyApp ./app

# expose port
EXPOSE 3838

# run app on container start
CMD ["R", "-e", "shiny::runApp('/app', host = '0.0.0.0', port = 3838)"]
