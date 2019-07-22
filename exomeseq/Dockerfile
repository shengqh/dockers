FROM shengqh/bioinfo:base

ENV BWA_VERSION="0.7.17"
RUN wget -O bwa-${BWA_VERSION}.tar.bz2 https://sourceforge.net/projects/bio-bwa/files/bwa-${BWA_VERSION}.tar.bz2/download; \
    tar -jxvf bwa-${BWA_VERSION}.tar.bz2 ; \
    cd bwa-${BWA_VERSION}; \
    make; \
    cp bwa /usr/bin ; \
    cd .. ; \
    rm -rf bwa-${BWA_VERSION}

RUN R -e "BiocManager::install(c('ComplexHeatmap', 'maftools', 'Biostrings', 'Rsamtools', 'biomaRt'))"
RUN R -e "library('devtools'); install_github('im3sanger/dndscv'); install_github('slzhao/mafreport')"

COPY gatk3.jar picard.jar /opt/

RUN mkdir /opt/annovar
ADD annovar /opt/annovar
ENV PATH=/opt/annovar:$PATH
