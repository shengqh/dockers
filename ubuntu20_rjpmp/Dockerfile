FROM ubuntu:20.04

RUN mkdir /scratch /data

RUN apt-get update && apt-get install -y apt-utils locales && \
    echo "LC_ALL=en_US.UTF-8" >> /etc/environment && \
    echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && \
    echo "LANG=en_US.UTF-8" > /etc/locale.conf && \
    locale-gen en_US.UTF-8

#20201102: R 4.0.3
RUN apt-get install -y \
    dirmngr \
    gnupg \
    software-properties-common
    
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 && \
    add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/' && \
    apt-get update && apt-get install -y r-base

#20201102: java 1.8.0_272
RUN apt install -y openjdk-8-jre

#20201102: perl 5.30.3
RUN apt-get install -y \
    apt-transport-https \
    ca-certificates \
    libxml2-dev \
    libcurl4-openssl-dev \
    wget \
    git \
    pandoc \
    libterm-readline-gnu-perl \
    curl \
    libcurl3-dev \
    libssl-dev \
    build-essential

RUN curl -L http://cpanmin.us | perl - Perl::Core;

#20201102: mono 6.12.0.90
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
    echo "deb https://download.mono-project.com/repo/ubuntu stable-focal main" | tee /etc/apt/sources.list.d/mono-official-stable.list && \
    apt-get update && \
    apt-get install -y mono-devel

RUN apt-get update && \
    apt-get -y install python3-pip && \
    pip3 install --upgrade pip
