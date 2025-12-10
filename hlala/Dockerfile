# work from latest LTS ubuntu release
FROM ubuntu:22.04

# modified from https://github.com/zlskidmore/docker-hla-la/blob/master/Dockerfile

# set the environment variables
ENV hla_la_version=1.0.4
ENV samtools_version=1.22.1
ENV bwa_version=0.7.19
ENV picard_version=3.4.0
ENV bamtools_version=2.5.3

# run update and install necessary tools ubuntu tools
RUN apt-get update -y && apt-get install -y \
    build-essential \
    curl \
    unzip \
    zlib1g-dev \
    libncurses5-dev \
    libncursesw5-dev \
    libnss-sss \
    libbz2-dev \
    liblzma-dev \
    vim \
    less \
    libcurl4-openssl-dev \
    wget \
    libz-dev \
    openjdk-8-jre \
    libboost-all-dev \
    cmake \
    libjsoncpp-dev

# install samtools
RUN cd /opt && \
  wget https://github.com/samtools/samtools/releases/download/${samtools_version}/samtools-${samtools_version}.tar.bz2 && \
  tar -xjf samtools-${samtools_version}.tar.bz2 && \
  rm samtools-${samtools_version}.tar.bz2 && \
  cd samtools-${samtools_version} && \
  ./configure && \
  make && \
  make install && \
  cd /opt && \
  rm -rf samtools-${samtools_version} && \
  samtools --version

# install picard
WORKDIR /usr/local/bin
RUN wget https://github.com/broadinstitute/picard/releases/download/${picard_version}/picard.jar

# install bwa
RUN cd /opt && \
  wget https://github.com/lh3/bwa/archive/v${bwa_version}.tar.gz && \
  tar -xzf v${bwa_version}.tar.gz && \
  rm v${bwa_version}.tar.gz && \
  cd bwa-${bwa_version} && \
  make && \
  cp bwa /usr/local/bin/ && \
  cd /opt && \
  rm -rf bwa-${bwa_version} 

# install bamtools
RUN cd /usr/local/bin && \
  wget https://github.com/pezmaster31/bamtools/archive/v${bamtools_version}.zip && \
  unzip v${bamtools_version}.zip && \
  rm v${bamtools_version}.zip && \
  cd bamtools-${bamtools_version} && \
  mkdir -p build && \
  cd build && \
  cmake -DCMAKE_INSTALL_PREFIX=/usr/local .. && \
  make && \
  make install && \
  bamtools --version

# install hla*la
WORKDIR /usr/local/bin
RUN mkdir -p /usr/local/bin/HLA-LA/bin
RUN mkdir -p /usr/local/bin/HLA-LA/src
RUN mkdir -p /usr/local/bin/HLA-LA/obj
RUN mkdir -p /usr/local/bin/HLA-LA/temp
RUN mkdir -p /usr/local/bin/HLA-LA/working
RUN mkdir -p /usr/local/bin/HLA-LA/graphs
WORKDIR /usr/local/bin/
RUN wget https://github.com/DiltheyLab/HLA-LA/archive/v${hla_la_version}.zip
RUN unzip v${hla_la_version}.zip
RUN mv /usr/local/bin/HLA-LA-${hla_la_version}/* /usr/local/bin/HLA-LA/src/
RUN rm -rf /usr/local/bin/HLA-LA-${hla_la_version}
WORKDIR /usr/local/bin/HLA-LA/src
RUN sed -i 's@\$(BAMTOOLS_PATH)/lib64@\$(BAMTOOLS_PATH)/lib@' makefile
RUN make all BOOST_PATH=/usr/include/boost BAMTOOLS_PATH=/usr/local

# modify paths.ini for hla*la
RUN sed -i 's@samtools_bin=@samtools_bin=/usr/local/bin/samtools@' paths.ini && \
  sed -i 's@bwa_bin=@bwa_bin=/usr/local/bin/bwa@' paths.ini && \
  sed -i 's@picard_sam2fastq_bin=.*@picard_sam2fastq_bin=/usr/local/bin/picard.jar@' paths.ini && \
  cat paths.ini

# some final cleanup and command
WORKDIR /usr/local/bin
ENV PATH="/usr/local/bin/HLA-LA/bin/:${PATH}"
ENV PATH="/usr/local/bin/HLA-LA/src/:${PATH}"