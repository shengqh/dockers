FROM bioconductor/bioconductor_docker:RELEASE_3_19

RUN apt-get update -qq && apt-get install -y --fix-missing \
  libboost-all-dev \
  software-properties-common

ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/jvm/java-11-openjdk-amd64/lib/server
RUN add-apt-repository -y ppa:ubuntu-toolchain-r/test

RUN apt-get update -qq &&  apt-get install -y --fix-missing \
  g++-11 \
  libomp-dev \
  libcurl4-openssl-dev \
  librtmp-dev \
  python3-pip \
  xdg-utils 

RUN pip3 install igraph

RUN Rscript --slave --no-save --no-restore-history -e 'install.packages("languageserver");library("languageserver")'
RUN Rscript --slave --no-save --no-restore-history -e 'BiocManager::install(ask=F)'
RUN Rscript --slave --no-save --no-restore-history -e 'BiocManager::install("jsonlite",ask=F);library("jsonlite")'
RUN Rscript --slave --no-save --no-restore-history -e 'BiocManager::install("cran/rgdal",ask=F);library("rgdal")'


RUN apt-get install -y 
