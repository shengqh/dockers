FROM ubuntu:16.04

RUN mkdir /scratch /data 

RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y locales

RUN echo "LC_ALL=en_US.UTF-8" >> /etc/environment
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
RUN echo "LANG=en_US.UTF-8" > /etc/locale.conf
RUN locale-gen en_US.UTF-8

RUN apt-get install -y apt-transport-https ca-certificates libxml2-dev libcurl4-openssl-dev wget

RUN wget --version

RUN apt-get install -y perl
RUN apt-get install -y libterm-readline-gnu-perl
RUN perl --version

RUN echo "deb https://cloud.r-project.org/bin/linux/ubuntu xenial-cran35/ " >> /etc/apt/sources.list
RUN more /etc/apt/sources.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9

RUN apt-get update
RUN apt-get install -y r-base
RUN apt-get install -y r-base-dev

RUN R -e "install.packages(c(\"optparse\", \"shiny\", \"rmarkdown\", \"knitr\", \"ggplot2\", \"gridExtra\"))"
RUN R -e "if (!requireNamespace(\"BiocManager\", quietly = TRUE)) install.packages(\"BiocManager\")"
RUN R -e "BiocManager::install(\"GenomicRanges\")"
RUN R -e "BiocManager::install(\"DESeq2\")"
RUN R -e "BiocManager::install(ask=F)"

RUN apt-get install -y git 

RUN R --version
