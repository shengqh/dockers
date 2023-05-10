FROM shengqh/bioinfo_base:20230503

RUN R -e "BiocManager::install('vegan')"
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

RUN git config --global pull.rebase false

ENV NGSPERL_VERSION="20230503"
RUN cd /opt/ngsperl && git pull

