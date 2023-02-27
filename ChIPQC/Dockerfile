FROM r-base:4.0.3

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

RUN apt-get install -y libharfbuzz-dev libfribidi-dev
RUN R -e "BiocManager::install('textshaping'); library('textshaping')"

RUN R -e "BiocManager::install('tidyverse'); library('tidyverse')"
RUN R -e "BiocManager::install('BiocParallel'); library('BiocParallel')"
RUN R -e "BiocManager::install('biomaRt'); library('biomaRt')"

RUN R -e "require(remotes);install_version('locfit', version='1.5-9.4',repos = 'http://cran.us.r-project.org'); library('locfit')"

ENV ChIPQC_VERSION="202300226"
RUN R -e "BiocManager::install('shengqh/ChIPQC'); library('ChIPQC')"
