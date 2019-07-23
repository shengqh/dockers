FROM shengqh/bioinfo:base

ARG BOWTIE_VERSION="1.2.3"
RUN cd /opt; \
    wget https://github.com/BenLangmead/bowtie/releases/download/v${BOWTIE_VERSION}/bowtie-${BOWTIE_VERSION}-linux-x86_64.zip; \
    unzip bowtie-${BOWTIE_VERSION}-linux-x86_64.zip; \
    rm bowtie-${BOWTIE_VERSION}-linux-x86_64.zip
ENV PATH=$PATH:/opt/bowtie-${BOWTIE_VERSION}-linux-x86_64
RUN bowtie --version

RUN R -e "BiocManager::install(c('DESeq2', 'VennDiagram', 'edgeR', 'DT', 'cowplot'))"
RUN R -e "library(DESeq2); library(VennDiagram); library(edgeR); library(DT); library(cowplot);"

ENV SAMTOOLS_VERSION="1.9"
RUN wget https://github.com/samtools/samtools/releases/download/${SAMTOOLS_VERSION}/samtools-${SAMTOOLS_VERSION}.tar.bz2 ; \
    tar -jxvf samtools-${SAMTOOLS_VERSION}.tar.bz2 ; \
    cd samtools-${SAMTOOLS_VERSION} ; \
    ./configure ; \
    make ; \
    make install ; \
    cd .. ; \
    rm -rf samtools-${SAMTOOLS_VERSION}
RUN samtools --version

RUN R -e "BiocManager::install(c('ggpubr', 'colorRamps'))"
RUN R -e "library(ggpubr); library(colorRamps);"
