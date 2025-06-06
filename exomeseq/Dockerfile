FROM shengqh/bioinfo_base:20231016

RUN apt-get update
RUN apt-get install -y libcairo2-dev

ENV BWA_VERSION="0.7.18"
RUN cd \opt; \
    wget https://github.com/lh3/bwa/archive/refs/tags/v${BWA_VERSION}.tar.gz; \
    tar -xzvf v${BWA_VERSION}.tar.gz ; \
    cd bwa-${BWA_VERSION}; \
    make; \
    make install; \
    cp bwa /usr/bin ; \
    cd .. ; \
    rm -rf bwa-${BWA_VERSION}

COPY gatk3.jar picard.jar /opt/

RUN mkdir /opt/annovar
ADD annovar /opt/annovar
ENV PATH=/opt/annovar:$PATH

ENV Vcfanno_VERSION="0.3.5"
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
RUN R -e "BiocManager::install('Cairo');library('Cairo')"
RUN R -e "BiocManager::install('ComplexHeatmap');library('ComplexHeatmap')"
RUN R -e "BiocManager::install('cn.mops');library('cn.mops')"
RUN R -e "BiocManager::install('DNAcopy');library('DNAcopy')"
RUN R -e "BiocManager::install('data.table');library('data.table')"
RUN R -e "BiocManager::install('reshape2');library('reshape2')"
RUN R -e "BiocManager::install('knitr');library('knitr')"
RUN R -e "BiocManager::install('rmarkdown');library('rmarkdown')"
RUN R -e "BiocManager::install('kableExtra');library('kableExtra')"
RUN R -e "BiocManager::install('DT');library('DT')"
RUN R -e "BiocManager::install('RCurl');library('RCurl')"
RUN R -e "BiocManager::install('htmltools');library('htmltools')"
RUN R -e "BiocManager::install('stringr');library('stringr')"
RUN R -e "BiocManager::install('karyoploteR');library('karyoploteR')"
RUN R -e "BiocManager::install('dplyr');library('dplyr')"
RUN R -e "BiocManager::install('tibble');library('tibble')"

#RUN R -e "BiocManager::install('tidyverse');library('tidyverse')"#tidyverse is very hard to install.

RUN cd /usr/bin; \ 
    wget https://github.com/arq5x/bedtools2/releases/download/v2.30.0/bedtools.static.binary; \
    mv bedtools.static.binary bedtools; \
    chmod 755 bedtools; \
    bedtools -h

RUN cd /opt && \
  curl -fsSL https://github.com/FelixKrueger/TrimGalore/archive/0.6.10.tar.gz -o trim_galore.tar.gz && \
  tar xvzf trim_galore.tar.gz && \
  rm trim_galore.tar.gz && \
  TrimGalore-0.6.10/trim_galore --help

ENV PATH=/opt/TrimGalore-0.6.10:$PATH

RUN pip3 install fastqsplitter

#use old version of BiocFileCache (2.8.0) will cause error in getBM with useCache=TRUE
RUN R -e "BiocManager::install('Bioconductor/BiocFileCache', force=TRUE);packageVersion('BiocFileCache')"
