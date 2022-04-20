FROM shengqh/bioinfo:base

RUN R -e "BiocManager::install(c('DESeq2', 'VennDiagram', 'edgeR', 'DT', 'cowplot'))"
RUN R -e "BiocManager::install(c('ggpubr', 'colorRamps'))"
RUN R -e "BiocManager::install(ask=F)"

RUN apt-get install -y lftp
RUN apt-get install -y unzip

RUN pip3 install --upgrade pip
RUN pip3 install --no-cache-dir --upgrade \
    pysam \
    biopython \
    pytabix

ENV PATH=/opt/sratoolkit.2.10.8-ubuntu64/bin:$PATH
RUN R -e "BiocManager::install('vegan')"
RUN R -e "BiocManager::install('heatmap3'); library('heatmap3')"
RUN R -e "BiocManager::install('knitr'); library('knitr')"
RUN R -e "BiocManager::install('rmarkdown'); library('rmarkdown')"

#for EnhancedVolcano
RUN apt-get install -y libproj-dev
RUN R -e "BiocManager::install('proj4'); library('proj4')"
RUN apt-get update
RUN apt-get install -y libcairo2-dev
RUN R -e "BiocManager::install('Cairo'); library('Cairo')"
RUN apt-get install -y libharfbuzz-dev libfribidi-dev
RUN R -e "BiocManager::install('textshaping'); library('textshaping')"
RUN R -e "BiocManager::install('ragg'); library('ragg')"
RUN R -e "BiocManager::install('ggalt'); library('ggalt')"
RUN R -e "BiocManager::install('ggrastr'); library('ggrastr')"
RUN R -e "BiocManager::install('EnhancedVolcano'); library('EnhancedVolcano')"

RUN R -e "BiocManager::install(ask=FALSE)"

ARG BOWTIE_VERSION="1.3.1"
RUN cd /opt; \
    wget https://github.com/BenLangmead/bowtie/releases/download/v${BOWTIE_VERSION}/bowtie-${BOWTIE_VERSION}-linux-x86_64.zip; \
    unzip bowtie-${BOWTIE_VERSION}-linux-x86_64.zip; \
    rm bowtie-${BOWTIE_VERSION}-linux-x86_64.zip
ENV PATH=$PATH:/opt/bowtie-${BOWTIE_VERSION}-linux-x86_64
RUN bowtie --version

ARG BLAST_VERSION="2.13.0"
RUN cd /opt; \
    wget ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/${BLAST_VERSION}/ncbi-blast-${BLAST_VERSION}+-x64-linux.tar.gz; \
    tar -xzvf ncbi-blast-${BLAST_VERSION}+-x64-linux.tar.gz; \
    rm ncbi-blast-${BLAST_VERSION}+-x64-linux.tar.gz; 
ENV PATH=/opt/ncbi-blast-${BLAST_VERSION}+/bin:$PATH
RUN blastn -version

ARG CQSTOOLS_VERSION="1.8.12"  
RUN cd /opt; \
    wget https://github.com/shengqh/CQS.Tools/releases/download/v${CQSTOOLS_VERSION}/cqstools.${CQSTOOLS_VERSION}.zip; \
    unzip cqstools.${CQSTOOLS_VERSION}.zip; \
    rm cqstools.${CQSTOOLS_VERSION}.zip; \
    chmod 755 cqstools.${CQSTOOLS_VERSION}/cqstools; 
ENV PATH=/opt/cqstools.${CQSTOOLS_VERSION}:$PATH

ARG SPCOUNT_VERSION="0.0.8"
RUN cd /opts; \
    git clone https://github.com/shengqh/spcount; \
    cd spcount; \
    pip3 install . ; \
    cd ..; \
    rm -rf spcount; \
    spcount -h
