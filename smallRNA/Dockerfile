FROM shengqh/bioinfo:base

RUN R -e "BiocManager::install(c('DESeq2', 'VennDiagram', 'edgeR', 'DT', 'cowplot'))"
RUN R -e "BiocManager::install(c('ggpubr', 'colorRamps'))"
RUN R -e "BiocManager::install(ask=F)"

ARG BOWTIE_VERSION="1.3.0"
RUN cd /opt; \
    wget https://github.com/BenLangmead/bowtie/releases/download/v${BOWTIE_VERSION}/bowtie-${BOWTIE_VERSION}-linux-x86_64.zip; \
    unzip bowtie-${BOWTIE_VERSION}-linux-x86_64.zip; \
    rm bowtie-${BOWTIE_VERSION}-linux-x86_64.zip
ENV PATH=$PATH:/opt/bowtie-${BOWTIE_VERSION}-linux-x86_64
RUN bowtie --version

RUN apt-get install lftp
RUN apt-get install -y unzip

RUN cqstools

ARG BLAST_VERSION="2.10.1"
RUN cd /opt; \
    wget ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/${BLAST_VERSION}/ncbi-blast-${BLAST_VERSION}+-x64-linux.tar.gz; \
    tar -xzvf ncbi-blast-${BLAST_VERSION}+-x64-linux.tar.gz; \
    rm ncbi-blast-${BLAST_VERSION}+-x64-linux.tar.gz; 
ENV PATH=/opt/ncbi-blast-${BLAST_VERSION}+/bin:$PATH

RUN blastn -version

RUN pip3 install --upgrade pip

ARG SPCOUNT_VERSION="0.0.3"
RUN pip3 install git+git://github.com/shengqh/spcount.git

RUN pip3 install --no-cache-dir --upgrade \
    pysam \
    biopython \
    pytabix

ENV PATH=/opt/sratoolkit.2.10.8-ubuntu64/bin:$PATH
