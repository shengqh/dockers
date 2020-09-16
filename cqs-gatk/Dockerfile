FROM broadinstitute/gatk:4.1.8.1

RUN mkdir /scratch /data

RUN apt-get update
RUN apt-get install -y apt-utils locales

RUN echo "LC_ALL=en_US.UTF-8" >> /etc/environment
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
RUN echo "LANG=en_US.UTF-8" > /etc/locale.conf
RUN locale-gen en_US.UTF-8

RUN apt-get install -y libbz2-dev
RUN apt-get install -y libxml2-dev 
RUN apt-get install -y libcurl4-openssl-dev 
RUN apt-get install -y apt-transport-https 
RUN apt-get install -y ca-certificates 
RUN apt-get install -y wget git pandoc 
RUN apt-get install -y liblzma-dev 

ENV BCFTOOLS_VERSION="1.10.2"
RUN wget https://github.com/samtools/bcftools/releases/download/${BCFTOOLS_VERSION}/bcftools-${BCFTOOLS_VERSION}.tar.bz2 ; \
    tar -jxvf bcftools-${BCFTOOLS_VERSION}.tar.bz2 ; \
    cd bcftools-${BCFTOOLS_VERSION} ; \
    ./configure ; \
    make ; \
    make install ; \
    cd .. ; \
    rm -rf bcftools-${BCFTOOLS_VERSION}
RUN bcftools --version

