FROM shengqh/bioinfo:base

ENV BWA_VERSION="0.7.17"
RUN wget http://downloads.sourceforge.net/project/bio-bwa/bwa-${BWA_VERSION}.tar.bz2; \
    tar -jxvf bwa-${BWA_VERSION}.tar.bz2 ; \
    cd bwa-${BWA_VERSION}; \
    make; \
    cp bwa /usr/bin ; \
    cd .. ; \
    rm -rf bwa-${BWA_VERSION}

COPY gatk3.jar picard.jar /opt/

RUN mkdir /opt/annovar
ADD annovar /opt/annovar
ENV PATH=/opt/annovar:$PATH

ENV Vcfanno_VERSION="0.3.2"
RUN wget https://github.com/brentp/vcfanno/releases/download/v${Vcfanno_VERSION}/vcfanno_linux64 ; \
    chmod 755 vcfanno_linux64 ; \
    mv vcfanno_linux64 /usr/bin/vcfanno

ARG SUBREAD_VERSION="2.0.2"
RUN cd /opt; \
    wget -O subread-${SUBREAD_VERSION}-Linux-x86_64.tar.gz https://sourceforge.net/projects/subread/files/subread-${SUBREAD_VERSION}/subread-${SUBREAD_VERSION}-Linux-x86_64.tar.gz/download; \
    tar -xzvf subread-${SUBREAD_VERSION}-Linux-x86_64.tar.gz; \
    rm subread-${SUBREAD_VERSION}-Linux-x86_64.tar.gz
ENV PATH=/opt/subread-${SUBREAD_VERSION}-Linux-x86_64/bin:$PATH

RUN featureCounts -v

RUN apt-get install -y tabix

RUN pip3 install --no-cache-dir --upgrade \
    pysam \
    biopython \
    pytabix

RUN R -e "BiocManager::install(ask=FALSE)"
RUN R -e "BiocManager::install('readr');library('readr')"
RUN R -e "BiocManager::install('stringr');library('stringr')"
RUN R -e "BiocManager::install('RColorBrewer');library('RColorBrewer')"
RUN R -e "BiocManager::install('forcats');library('forcats')"
RUN R -e "BiocManager::install('getopt');library('getopt')"
RUN R -e "BiocManager::install('pheatmap');library('pheatmap')"
RUN R -e "BiocManager::install('R.utils');library('R.utils')"
RUN R -e "BiocManager::install('dendextend');library('dendextend')"
RUN R -e "BiocManager::install(c('Biostrings', 'Rsamtools', 'biomaRt', 'VennDiagram', 'cowplot'))"
RUN R -e "BiocManager::install('mclust');library('mclust')"

RUN R -e "BiocManager::install('ComplexHeatmap');library('ComplexHeatmap')"
