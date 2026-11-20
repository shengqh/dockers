FROM shengqh/bioinfo_base:20260828

RUN git config --global pull.rebase false

RUN R -e "install.packages('tidyverse');library('tidyverse')"
RUN R -e "BiocManager::install(c('vegan', 'yihui/knitr', 'genefilter'))"
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

ENV NGSPERL_VERSION="20260830"
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

RUN mkdir -p /opt/dotnet; \
    cd /opt/dotnet; \
    wget https://dot.net/v1/dotnet-install.sh; \
    chmod +x dotnet-install.sh; \
    ./dotnet-install.sh --channel 10.0 --install-dir /opt/dotnet; \
    rm dotnet-install.sh
ENV PATH=/opt/dotnet:$PATH


ARG SMALLRNACOUNT_VERSION="1.0.1"
RUN mkdir -p /opt/SmallRNACountBuilder; \
    cd /opt/SmallRNACountBuilder; \
    wget https://github.com/shengqh/SmallRNACountBuilder/releases/download/v${SMALLRNACOUNT_VERSION}/SmallRNACountBuilder.v${SMALLRNACOUNT_VERSION}.zip; \
    unzip SmallRNACountBuilder.v${SMALLRNACOUNT_VERSION}.zip; \
    rm SmallRNACountBuilder.v${SMALLRNACOUNT_VERSION}.zip; \
    dotnet /opt/SmallRNACountBuilder/SmallRNACountBuilder.dll --version

