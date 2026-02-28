FROM python:3.14.2-trixie

RUN apt-get update
RUN apt-get install -y wget bzip2 build-essential zlib1g-dev
RUN apt-get install -y libncurses-dev libbz2-dev liblzma-dev
RUN apt-get install -y libcurl4-gnutls-dev libssl-dev

ENV SAMTOOLS_VERSION="1.23"

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

RUN pip install umi_tools; umi_tools --version
