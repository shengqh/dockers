FROM bioconductor/bioconductor_docker:3.21-r-4.5.1

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

RUN Rscript --slave --no-save --no-restore-history -e 'install.packages("languageserver");library("languageserver")'
RUN Rscript --slave --no-save --no-restore-history -e 'install.packages("jsonlite");library("jsonlite")'

RUN mkdir -p /opt/cargo && \
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | CARGO_HOME=/opt/cargo RUSTUP_HOME=/opt/rustup sh -s -- -y && \
  echo 'export CARGO_HOME=/opt/cargo' >> $HOME/.bashrc && \
  echo 'export RUSTUP_HOME=/opt/rustup' >> $HOME/.bashrc && \
  echo 'export PATH=/opt/cargo/bin:$PATH' >> $HOME/.bashrc

ENV PATH=/opt/cargo/bin:$PATH
ENV CARGO_HOME=/opt/cargo
ENV RUSTUP_HOME=/opt/rustup

RUN rustup default stable

RUN rustc --version
RUN cargo --version

ARG UPDATE_DATE=20250908
RUN Rscript --slave --no-save --no-restore-history -e 'BiocManager::install(ask=F)'
