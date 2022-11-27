#FROM shengqh/bioinfo:ubuntu20.04_r4.0_java1.8_perl5.30_mono6.12_python3.8
FROM shengqh/ubuntu20.04_r4.2.2_java11.0.17_perl5.30.0_mono6.12.0.182_python3.8.10:20221127

RUN pip3 install --upgrade pip; \
    pip3 install wheel

RUN apt-get update
RUN apt-get install -y libgd-dev

ARG PIGZ_VERSION="2.7"
RUN cd /opt; \
    wget https://zlib.net/pigz/pigz-${PIGZ_VERSION}.tar.gz ; \
    tar -xzvf pigz-${PIGZ_VERSION}.tar.gz; \
    rm pigz-${PIGZ_VERSION}.tar.gz; \
    cd pigz-${PIGZ_VERSION}; \
    make; \
    mv pigz unpigz /usr/bin; \
    cd ..; \
    rm -rf pigz-${PIGZ_VERSION}; \
    pigz -h

RUN pip3 install cutadapt; \
    cutadapt --version

RUN pip3 install multiqc; \
    multiqc --version

RUN pip3 install --no-cache-dir --upgrade \
    pysam \
    biopython \
    pytabix

RUN curl -L http://cpanmin.us | perl - Getopt::Long;
RUN curl -L http://cpanmin.us | perl - --force Bio::SeqIO;
RUN curl -L http://cpanmin.us | perl - Algorithm::Loops;
RUN curl -L http://cpanmin.us | perl - Hash::Merge;
RUN curl -L http://cpanmin.us | perl - String::Util;

ENV SAMTOOLS_VERSION="1.16.1"
RUN cd /opt; \
    wget https://github.com/samtools/samtools/releases/download/${SAMTOOLS_VERSION}/samtools-${SAMTOOLS_VERSION}.tar.bz2 ; \
    tar -jxvf samtools-${SAMTOOLS_VERSION}.tar.bz2 ; \
    cd samtools-${SAMTOOLS_VERSION} ; \
    ./configure ; \
    make ; \
    make install ; \
    cd .. ; \
    rm -rf samtools-${SAMTOOLS_VERSION}; \
    samtools --version

ENV BCFTOOLS_VERSION="1.16"
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

ARG FASTQC_VERSION="v0.11.9"
RUN cd /opt; \
    wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_${FASTQC_VERSION}.zip; \
    unzip fastqc_${FASTQC_VERSION}.zip; \
    rm fastqc_${FASTQC_VERSION}.zip; \
    chmod 755 FastQC/fastqc; \
    sed -i 's/250/5000/g' /opt/FastQC/fastqc
ENV PATH=/opt/FastQC:$PATH
RUN fastqc --version                                                                                                                                                                                                                                                                         

ARG SAMBAMBA_VERSION="0.8.2"
RUN wget https://github.com/biod/sambamba/releases/download/v${SAMBAMBA_VERSION}/sambamba-${SAMBAMBA_VERSION}-linux-amd64-static.gz ; \
    gunzip sambamba-${SAMBAMBA_VERSION}-linux-amd64-static.gz ; \
    chmod 755 sambamba-${SAMBAMBA_VERSION}-linux-amd64-static ; \
    mv sambamba-${SAMBAMBA_VERSION}-linux-amd64-static /usr/bin/sambamba ; \
    sambamba --version

RUN cd /opt; \
    wget ftp://ftp.ncbi.nlm.nih.gov/entrez/entrezdirect/edirect.tar.gz; \
    tar -xzvf edirect.tar.gz; \
    rm edirect.tar.gz; \
    ./edirect/setup.sh; \
    /opt/edirect/esearch -h
ENV PATH=/opt/edirect:$PATH

ARG sratoolkit_VERSION="3.0.1"
RUN cd /opt; \
    wget https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/${sratoolkit_VERSION}/sratoolkit.${sratoolkit_VERSION}-ubuntu64.tar.gz; \
    tar -xzvf sratoolkit.${sratoolkit_VERSION}-ubuntu64.tar.gz; \
    rm sratoolkit.${sratoolkit_VERSION}-ubuntu64.tar.gz; 
ENV PATH=/opt/sratoolkit.${sratoolkit_VERSION}-ubuntu64/bin:$PATH

RUN mkdir /workspace
RUN mkdir /data1
RUN apt-get install -y tabix

RUN R -e 'install.packages("BiocManager");BiocManager::install()'
RUN R -e "BiocManager::install('remotes'); library('remotes')"
RUN R -e "BiocManager::install('ggplot2'); library('ggplot2')"
RUN R -e "BiocManager::install('rmarkdown'); library('rmarkdown')"
RUN R -e "BiocManager::install('knitr'); library('knitr')"
RUN R -e "BiocManager::install('patchwork'); library('patchwork')"
RUN R -e "BiocManager::install('ggExtra'); library('ggExtra')"
RUN R -e "BiocManager::install('cran/XML'); library('XML')"

RUN apt-get install -y libharfbuzz-dev libfribidi-dev

RUN R -e "BiocManager::install('pkgdown'); library('pkgdown')"
RUN R -e 'install.packages("devtools");library(devtools)'
RUN R -e "BiocManager::install('stringr', ask=F); library('stringr')"
RUN R -e "BiocManager::install('DT', ask=F); library('DT')"
RUN R -e "BiocManager::install('VennDiagram', ask=F); library('VennDiagram')"
RUN R -e "BiocManager::install('DESeq2', ask=F); library('DESeq2')"
RUN R -e "BiocManager::install('edgeR', ask=F); library('edgeR')"
RUN R -e "BiocManager::install('cowplot', ask=F); library('cowplot')"

RUN apt install -y cmake

RUN R -e "BiocManager::install('ggpubr', ask=F); library('ggpubr')"
RUN R -e "BiocManager::install('rlist', ask=F); library('rlist')"
RUN R -e "BiocManager::install('kableExtra', ask=F); library('kableExtra')"
RUN R -e "BiocManager::install('tidyverse', ask=F); library('tidyverse')"

RUN pip3 install pysam

ARG CQSTOOLS_VERSION="1.8.14"  
RUN cd /opt; \
    wget https://github.com/shengqh/CQS.Tools/releases/download/v${CQSTOOLS_VERSION}/cqstools.${CQSTOOLS_VERSION}.zip; \
    unzip cqstools.${CQSTOOLS_VERSION}.zip; \
    rm cqstools.${CQSTOOLS_VERSION}.zip; \
    chmod 755 cqstools.${CQSTOOLS_VERSION}/cqstools
ENV PATH=/opt/cqstools.${CQSTOOLS_VERSION}:$PATH
