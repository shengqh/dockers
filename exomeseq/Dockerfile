FROM shengqh/bioinfo:base

ENV BWA_VERSION="0.7.17"
RUN wget http://downloads.sourceforge.net/project/bio-bwa/bwa-${BWA_VERSION}.tar.bz2; \
    tar -jxvf bwa-${BWA_VERSION}.tar.bz2 ; \
    cd bwa-${BWA_VERSION}; \
    make; \
    cp bwa /usr/bin ; \
    cd .. ; \
    rm -rf bwa-${BWA_VERSION}

ENV SAMBAMBA_VERSION="0.7.0"
RUN wget https://github.com/biod/sambamba/releases/download/v${SAMBAMBA_VERSION}/sambamba-${SAMBAMBA_VERSION}-linux-static.gz ; \
    gunzip sambamba-${SAMBAMBA_VERSION}-linux-static.gz ; \
    chmod 755 sambamba-${SAMBAMBA_VERSION}-linux-static ; \
    mv sambamba-${SAMBAMBA_VERSION}-linux-static /usr/bin/sambamba
RUN sambamba --version

COPY gatk3.jar picard.jar /opt/

RUN mkdir /opt/annovar
ADD annovar /opt/annovar
ENV PATH=/opt/annovar:$PATH

RUN R -e "BiocManager::install(c('Biostrings', 'Rsamtools', 'biomaRt', 'VennDiagram', 'cowplot'))"
RUN R -e "BiocManager::install('mclust')"
RUN R -e "BiocManager::install(ask=FALSE)"
RUN R -e "BiocManager::install('PoisonAlien/maftools')"
RUN R -e "BiocManager::install('im3sanger/dndscv')"
RUN R -e "BiocManager::install('slzhao/mafreport')"
RUN R -e "BiocManager::install('jokergoo/ComplexHeatmap')"

ENV Vcfanno_VERSION="0.3.2"
RUN wget https://github.com/brentp/vcfanno/releases/download/v${Vcfanno_VERSION}/vcfanno_linux64 ; \
    chmod 755 vcfanno_linux64 ; \
    mv vcfanno_linux64 /usr/bin/vcfanno

