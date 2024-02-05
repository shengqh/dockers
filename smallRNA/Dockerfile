FROM shengqh/bioinfo_base:20231016

RUN apt-get update && \
  apt-get install -y lftp unzip libsqlite3-dev libproj-dev libcairo2-dev libharfbuzz-dev libfribidi-dev

RUN pip3 install --no-cache-dir --upgrade pip
RUN pip3 install --no-cache-dir --upgrade pysam \
    biopython \
    pytabix \
    pandas \
    seaborn 

RUN git config --global pull.rebase false

RUN R -e "install.packages('tidyverse');library('tidyverse')"
RUN R -e "BiocManager::install(c('vegan', 'remotes', 'yihui/knitr', 'genefilter'))"
RUN R -e "BiocManager::install()"

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

ARG Krona_VERSION="2.8.1"
RUN cd /opt; \
    wget https://github.com/marbl/Krona/archive/refs/tags/v${Krona_VERSION}.tar.gz; \
    tar -xzvf v${Krona_VERSION}.tar.gz ; \
    rm v${Krona_VERSION}.tar.gz ; \
    cd Krona-${Krona_VERSION}/KronaTools; \
    ./install.pl

RUN cd /opt; \
    git clone https://github.com/brwnj/fastq-join.git; \
    cd fastq-join; \
    make; \
    mv fastq-join /usr/bin; \
    cd /opt; \
    rm -rf fastq-join; \
    fastq-join -h

ENV NGSPERL_VERSION="20231103"
RUN cd /opt/ngsperl && git pull
RUN R -e "BiocManager::install(ask=FALSE)"

ARG SPCOUNT_VERSION="0.0.16"
RUN cd /opt; \
    git clone https://github.com/shengqh/spcount; \
    cd spcount; \
    pip3 install . ; \
    cd ..; \
    rm -rf spcount; \
    spcount -h
