# work from latest LTS ubuntu release
FROM ubuntu:22.04

RUN apt-get update
RUN apt-get install -y wget bzip2 build-essential zlib1g-dev
RUN apt-get install -y libncurses-dev libbz2-dev liblzma-dev
RUN apt-get install -y libcurl4-gnutls-dev libssl-dev

ENV SAMTOOLS_VERSION="1.21"

RUN cd /opt; \
    wget https://github.com/samtools/htslib/releases/download/${SAMTOOLS_VERSION}/htslib-${SAMTOOLS_VERSION}.tar.bz2 ; \
    tar -jxvf htslib-${SAMTOOLS_VERSION}.tar.bz2; \
    cd /opt/htslib-${SAMTOOLS_VERSION} ; \
    ./configure ; \
    make ; \
    make install ; \
    cd .. ; \
    rm -rf htslib-${SAMTOOLS_VERSION} htslib-${SAMTOOLS_VERSION}.tar.bz2; \
    tabix --version

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

RUN cd /opt; \
    wget https://github.com/samtools/bcftools/releases/download/${SAMTOOLS_VERSION}/bcftools-${SAMTOOLS_VERSION}.tar.bz2 ; \
    tar -jxvf bcftools-${SAMTOOLS_VERSION}.tar.bz2 ; \
    cd bcftools-${SAMTOOLS_VERSION} ; \
    ./configure ; \
    make ; \
    make install ; \
    cd .. ; \
    rm -rf bcftools-${SAMTOOLS_VERSION}; \
    bcftools --version

ENV agd_vcf_VERSION="1.0.1"
RUN cd /usr/local/bin && wget https://raw.githubusercontent.com/shengqh/agd_vcf/refs/heads/main/agd_vcf && chmod +x agd_vcf

