FROM bioconductor/bioconductor_docker:RELEASE_3_20-R-4.4.2

SHELL ["/bin/bash", "-c"]

RUN apt-get update -qq && apt-get install -y --fix-missing \
  libboost-all-dev \
  software-properties-common

ENV LD_LIBRARY_PATH=/usr/lib/jvm/java-11-openjdk-amd64/lib/server
RUN add-apt-repository -y ppa:ubuntu-toolchain-r/test

RUN apt-get update -qq &&  apt-get install -y --fix-missing \
  g++-11 \
  libomp-dev \
  libcurl4-openssl-dev \
  librtmp-dev \
  python3-pip \
  xdg-utils \
  libxml2-dev

RUN apt install -y python3-igraph

RUN Rscript --slave --no-save --no-restore-history -e 'BiocManager::install(ask=F)'

# RUN cd /opt; \
#     wget https://cran.r-project.org/src/contrib/sp_2.2-0.tar.gz; \
#     tar -xzvf sp_2.2-0.tar.gz; \
#     cd sp; \
#     R CMD INSTALL .; \
#     mkdir -p /usr/local/lib/R/site-library/sp/include; \
#     cp src/sp.h /usr/local/lib/R/site-library/sp/include/sp.h
#RUN Rscript --slave --no-save --no-restore-history -e 'BiocManager::install("cran/rgdal",ask=F);library("rgdal")'

RUN Rscript --slave --no-save --no-restore-history -e 'install.packages("languageserver");library("languageserver")'

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y && \
  echo 'source $HOME/.cargo/env' >> $HOME/.bashrc

ENV PATH=/root/.cargo/bin:$PATH

RUN rustup default stable

RUN rustc --version
RUN cargo --version