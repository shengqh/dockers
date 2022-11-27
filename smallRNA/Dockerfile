FROM shengqh/cqs_smallrnaseq:20220429

RUN R -e "BiocManager::install('remotes'); library('remotes')"
RUN R -e "BiocManager::install('yihui/knitr'); library('knitr')"
RUN R -e "BiocManager::install('kableExtra'); library('kableExtra')"
RUN R -e "BiocManager::install()"

ARG Krona_VERSION="2.8.1"
RUN cd /opt; \
    wget https://github.com/marbl/Krona/archive/refs/tags/v${Krona_VERSION}.tar.gz; \
    tar -xzvf v${Krona_VERSION}.tar.gz ; \
    rm v${Krona_VERSION}.tar.gz ; \
    cd Krona-${Krona_VERSION}/KronaTools; \
    ./install.pl

ENV NGSPERL_VERSION="20220616"
RUN cd /opt; \
    git clone https://github.com/shengqh/ngsperl.git; \
    bash /opt/ngsperl/install_packages_nosudo.sh
ENV PERL5LIB=/opt/ngsperl/lib:$PERL5LIB

ARG SPCOUNT_VERSION="0.0.13"
RUN cd /opt; \
    git clone https://github.com/shengqh/spcount; \
    cd spcount; \
    pip3 install . ; \
    cd ..; \
    rm -rf spcount; \
    spcount -h

ENV NGSPERL_VERSION="20221020"
RUN cd /opt/ngsperl; \
    git pull

ARG CQSTOOLS_VERSION="1.8.14"  
RUN cd /opt; \
    wget https://github.com/shengqh/CQS.Tools/releases/download/v${CQSTOOLS_VERSION}/cqstools.${CQSTOOLS_VERSION}.zip; \
    unzip cqstools.${CQSTOOLS_VERSION}.zip; \
    rm cqstools.${CQSTOOLS_VERSION}.zip; \
    chmod 755 cqstools.${CQSTOOLS_VERSION}/cqstools; 
ENV PATH=/opt/cqstools.${CQSTOOLS_VERSION}:$PATH

