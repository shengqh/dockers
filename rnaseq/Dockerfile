FROM shengqh/bioinfo_base:20231016

RUN pip3 install --upgrade pip

RUN apt-get update && apt-get install -y libcairo2-dev

RUN pip3 install --no-cache-dir --upgrade \
    HTSeq \
    numpy

RUN R -e "BiocManager::install('igordot/msigdbr', ask=FALSE);library('msigdbr')"

RUN R -e "BiocManager::install(c('RColorBrewer', 'cowplot', 'grid', 'lattice', 'plyr', 'reshape', 'scales', 'preprocessCore', 'edgeR', 'DT', 'kableExtra'))"
RUN R -e "BiocManager::install('tidyverse');library('tidyverse')"
RUN R -e "BiocManager::install('TCGAbiolinks');library('TCGAbiolinks')"
RUN R -e "BiocManager::install('WebGestaltR');library('WebGestaltR')"
RUN R -e "BiocManager::install()"

RUN R -e "BiocManager::install('heatmap3');library('heatmap3')"
RUN R -e "BiocManager::install('umap');library('umap')"
RUN R -e "BiocManager::install('magrittr');library('magrittr')"

RUN R -e "BiocManager::install('areyesq89/DEXSeq');library('DEXSeq')"
RUN echo '#!/usr/bin/python3' > /usr/bin/dexseq_count.py; \
    cat /usr/local/lib/R/site-library/DEXSeq/python_scripts/dexseq_count.py >> /usr/bin/dexseq_count.py; \
    chmod 755 /usr/bin/dexseq_count.py; \
    echo '#!/usr/bin/python3' > /usr/bin/dexseq_prepare_annotation.py; \
    cat /usr/local/lib/R/site-library/DEXSeq/python_scripts/dexseq_prepare_annotation.py >> /usr/bin/dexseq_prepare_annotation.py; \
    chmod 755 /usr/bin/dexseq_prepare_annotation.py

RUN R -e "BiocManager::install(ask=FALSE)"

RUN cd /opt; \
    wget https://github.com/COMBINE-lab/salmon/releases/download/v1.10.0/salmon-1.10.0_linux_x86_64.tar.gz ; \
    tar -xzvf salmon-1.10.0_linux_x86_64.tar.gz ; \
    rm salmon-1.10.0_linux_x86_64.tar.gz ;
ENV PATH=/opt/salmon-latest_linux_x86_64/bin:$PATH

RUN apt-get install -y xxd

ARG STAR_VERSION="2.7.11a"
RUN cd /opt; \
    wget https://github.com/alexdobin/STAR/archive/${STAR_VERSION}.tar.gz; \
    tar -xzf ${STAR_VERSION}.tar.gz; \
    cd STAR-${STAR_VERSION}/source; \
    make STAR; \
    cp STAR /usr/local/bin; \
    cd ../..; \
    rm -rf STAR-${STAR_VERSION} ${STAR_VERSION}.tar.gz
RUN STAR --version

ARG FASTQC_VERSION="v0.12.1"
RUN cd /opt; \
    wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_${FASTQC_VERSION}.zip; \
    unzip fastqc_${FASTQC_VERSION}.zip; \
    rm fastqc_${FASTQC_VERSION}.zip; \
    chmod 755 FastQC/fastqc; \
    sed -i 's/250/5000/g' /opt/FastQC/fastqc

ARG NGSPERL_VERSION="20231105"
RUN cd /opt/ngsperl; \
    git pull

ARG STAR_FUSION_VERSION="v1.10.0"
RUN cd /opt; \
    wget https://github.com/STAR-Fusion/STAR-Fusion/releases/download/${STAR_FUSION_VERSION}/STAR-Fusion-${STAR_FUSION_VERSION}.FULL.tar.gz; \
    tar -xzf STAR-Fusion-${STAR_FUSION_VERSION}.FULL.tar.gz; \
    rm STAR-Fusion-${STAR_FUSION_VERSION}.FULL.tar.gz
ENV PATH=/opt/STAR-Fusion-${STAR_FUSION_VERSION}:$PATH
RUN STAR-Fusion --version

COPY gsea-3.0.jar gatk3.jar picard.jar /opt/

ARG SUBREAD_VERSION="2.0.6"
RUN cd /opt; \
    wget -O subread-${SUBREAD_VERSION}-Linux-x86_64.tar.gz https://sourceforge.net/projects/subread/files/subread-${SUBREAD_VERSION}/subread-${SUBREAD_VERSION}-Linux-x86_64.tar.gz/download; \
    tar -xzvf subread-${SUBREAD_VERSION}-Linux-x86_64.tar.gz; \
    rm subread-${SUBREAD_VERSION}-Linux-x86_64.tar.gz;
ENV PATH=/opt/subread-${SUBREAD_VERSION}-Linux-x86_64/bin:$PATH
RUN featureCounts -v

RUN cd /opt; \
    git clone https://github.com/slzhao/QC3.git; \
    chmod 755 /opt/QC3/qc3.pl
ENV PATH=/opt/QC3:$PATH

RUN apt-get install -y libgd-dev
RUN cd /opt; \
    wget https://github.com/StevenWingett/FastQ-Screen/archive/refs/tags/v0.15.3.tar.gz; \
    tar -xzf v0.15.3.tar.gz; \
    rm v0.15.3.tar.gz;
ENV PATH=/opt/FastQ-Screen-0.15.3:$PATH

RUN pip install umi_tools

