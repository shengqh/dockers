# work from latest LTS ubuntu release
FROM ubuntu:22.04

RUN apt-get update
RUN apt-get install -y wget bzip2 build-essential zlib1g-dev
RUN apt-get install -y libncurses-dev libbz2-dev liblzma-dev

ENV SAMTOOLS_VERSION="1.15.1"
RUN cd /opt; \
    wget https://github.com/samtools/samtools/releases/download/${SAMTOOLS_VERSION}/samtools-${SAMTOOLS_VERSION}.tar.bz2 ; \
    tar -jxvf samtools-${SAMTOOLS_VERSION}.tar.bz2; \
    cd /opt/samtools-${SAMTOOLS_VERSION} ; \
    ./configure ; \
    make ; \
    make install ; \
    cd .. ; \
    rm -rf samtools-${SAMTOOLS_VERSION}; \
    samtools --version

ENV BCFTOOLS_VERSION="1.15.1"
RUN cd /opt; \
    wget https://github.com/samtools/bcftools/releases/download/${BCFTOOLS_VERSION}/bcftools-${BCFTOOLS_VERSION}.tar.bz2 ; \
    tar -jxvf bcftools-${BCFTOOLS_VERSION}.tar.bz2 ; \
    cd bcftools-${BCFTOOLS_VERSION} ; \
    ./configure ; \
    make ; \
    make install ; \
    cd .. ; \
    rm -rf bcftools-${BCFTOOLS_VERSION}; \
    bcftools --version
