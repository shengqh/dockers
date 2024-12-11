FROM r-base:4.4.2


RUN apt-get update
RUN apt-get install -y libcurl4-openssl-dev libxml2-dev librsvg2-dev libv8-dev imagemagick libgit2-dev libharfbuzz-dev libfribidi-dev

RUN R -e 'install.packages(c("remotes", "BiocManager", "devtools"), ask=F)'
RUN R -e 'BiocManager::install(c("GenomicRanges","IRanges"))'
RUN R -e 'devtools::install_github("VanLoo-lab/ascat/ASCAT");library("ASCAT")'

RUN apt-get install -y git autoconf automake

RUN cd /opt; \
    git clone https://github.com/samtools/htslib.git; \
    cd htslib; \
    git submodule update --init --recursive; \
    autoreconf -i; \
    ./configure; \
    make & make install; \
    cd /opt & rm -rf htslib

RUN apt-get install -y curl

RUN cd /opt; \
    git clone https://github.com/cancerit/alleleCount.git; \
    cd alleleCount; \
    ./setup.sh /usr; \
    cd /opt & rm -rf alleleCount

RUN R -e 'BiocManager::install("dplyr")'
