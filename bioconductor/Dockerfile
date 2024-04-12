FROM bioconductor/bioconductor_docker:RELEASE_3_18

RUN apt-get update -qq
RUN apt-get install -y libboost-all-dev

RUN apt-get install -y software-properties-common
RUN apt-get update
RUN add-apt-repository -y ppa:ubuntu-toolchain-r/test
RUN apt-get install -y g++-11
RUN apt-get install -y libomp-dev \
  libcurl4-openssl-dev \
  librtmp-dev
RUN apt-get install -y python3-pip
RUN pip3 install igraph

RUN Rscript --slave --no-save --no-restore-history -e 'install.packages("languageserver");library("languageserver")'
RUN Rscript --slave --no-save --no-restore-history -e 'BiocManager::install(ask=F)'
RUN Rscript --slave --no-save --no-restore-history -e 'BiocManager::install("jsonlite",ask=F);library("jsonlite")'
RUN Rscript --slave --no-save --no-restore-history -e 'BiocManager::install("cran/rgdal",ask=F);library("rgdal")'

ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/jvm/java-11-openjdk-amd64/lib/server

RUN apt-get install -y xdg-utils --fix-missing