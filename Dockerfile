FROM rocker/r-ver:4.0.2
MAINTAINER Freddy Drennan
WORKDIR /home/plumber
ENV CRAN_REPO https://packagemanager.rstudio.com/all/__linux__/focal/338
EXPOSE 8000

RUN apt-get update -qq && apt-get -y --no-install-recommends install \
    make \
    libsodium-dev \
    libicu-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev

RUN Rscript -e 'install.packages("renv", repos = c("CRAN" = Sys.getenv("CRAN_REPO")))'
RUN Rscript -e 'install.packages("devtools", repos = c("CRAN" = Sys.getenv("CRAN_REPO")))'

COPY renv.lock .
RUN R -e "renv::consent(provided=TRUE)"
RUN R -e "renv::rebuild()"

COPY NAMESPACE .
COPY DESCRIPTION .
COPY R ./R
COPY man .
COPY ./plumber/entrypoint.R .
COPY ./plumber/plumber.R .


RUN R CMD INSTALL --no-multiarch --with-keep.source .

# CMD Rscript entrypoint.R
