FROM r-base

RUN R -e 'install.packages(c("remotes", "BiocManager"), ask=F)'

RUN apt-get update
RUN apt-get install -y libcurl4-openssl-dev
RUN apt-get install -y libxml2-dev
RUN apt-get install -y librsvg2-dev
RUN apt-get install -y libv8-dev
RUN apt-get install -y imagemagick
RUN apt-get install -y libgit2-dev

RUN R -e "BiocManager::install('TxDb.Hsapiens.UCSC.hg38.knownGene'); library('TxDb.Hsapiens.UCSC.hg38.knownGene')"
RUN R -e "BiocManager::install('kableExtra'); library('kableExtra')"
RUN R -e "BiocManager::install('tidyverse'); library('tidyverse')"

ENV ChIPQC_VERSION="20210325"
RUN R -e 'BiocManager::install("shengqh/ChIPQC")'

RUN R -e "BiocManager::install('BiocParallel'); library('BiocParallel')"
