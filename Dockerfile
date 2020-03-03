# get the base image, the rocker/verse has R, RStudio and pandoc
FROM rocker/verse:3.6.2

# required
MAINTAINER Your Name <your_email@somewhere.com>

COPY . /DATA-598-WI20-week-7

# go into the repo directory
RUN . /etc/environment \
  # Install linux depedendencies here
  # e.g. need this for ggforce::geom_sina
  && sudo apt-get update \
  && sudo apt-get install libudunits2-dev -y \
  # build this compendium package
  && R -e "devtools::install('/DATA-598-WI20-week-7', dep=TRUE)" \
  && R -e "devtools::check('/DATA-598-WI20-week-7')"
