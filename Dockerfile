# Dockerfile
FROM rocker/r-ver:4.0.2

RUN apt-get update -qq && apt-get -y --no-install-recommends install \
    make \
    libsodium-dev \
    libicu-dev \
    libcurl4-openssl-dev \
    libssl-dev

ENV CRAN_REPO https://packagemanager.rstudio.com/all/__linux__/focal/338

RUN Rscript -e 'install.packages(c("plumber", "promises", "future"), repos = c("CRAN" = Sys.getenv("CRAN_REPO")))'
RUN Rscript -e 'install.packages(c("stringr", "glue", "jsonlite"), repos = c("CRAN" = Sys.getenv("CRAN_REPO")))'
RUN Rscript -e 'install.packages(c("renv", "devtools"), repos = c("CRAN" = Sys.getenv("CRAN_REPO")))'

RUN groupadd -r plumber && useradd --no-log-init -r -g plumber plumber

ADD ./plumber/entrypoint.R /home/plumber/entrypoint.R
ADD ./plumber/plumber.R /home/plumber/plumber.R

EXPOSE 8000

WORKDIR /home/plumber

COPY renv.lock .
COPY NAMESPACE .
COPY DESCRIPTION .
COPY R .
COPY NAMESPACE .

RUN R -e "renv::consent(provided=TRUE);renv::rebuild()"
RUN R -e "devtools::install()"

USER plumber
CMD Rscript entrypoint.R
