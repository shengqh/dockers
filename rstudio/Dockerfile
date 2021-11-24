FROM rocker/rstudio:4.1.1

RUN mkdir /scratch
RUN mkdir /data

RUN apt-get update -qq
RUN apt-get install -y libboost-all-dev

RUN apt-get install -y software-properties-common
RUN apt-get update
RUN add-apt-repository -y ppa:ubuntu-toolchain-r/test
RUN apt-get install -y g++-11
RUN apt-get install -y libomp-dev
RUN apt-get install -y libcurl4-openssl-dev 
RUN apt-get install -y libcurl4-gnutls-dev
RUN apt-get install -y libssl-dev
RUN apt-get install -y libhdf5-dev
RUN apt-get install -y librtmp-dev 
RUN apt-get install -y libfontconfig1-dev 
RUN apt-get install -y libxml2-dev
RUN apt-get install -y python3-pip
RUN pip3 install igraph
