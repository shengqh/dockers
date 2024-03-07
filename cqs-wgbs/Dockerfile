# Build htslib from source
FROM r-base:4.3.2

RUN apt-get update && apt-get install -y libgd-dev libzstd-dev

RUN apt-get install -y \
    build-essential \
    cmake \
    zlib1g-dev \
    libhdf5-dev \
    libnss-sss \
    curl \
    autoconf \
    bzip2 \
    pigz \
    git \
    libncurses5-dev \
    libncursesw5-dev \
    libbz2-dev \
    liblzma-dev \
    bzip2 \
    unzip


RUN echo "options(repos = c(CRAN = 'https://cran.rstudio.com/'))" >> /usr/lib/R/etc/Rprofile.site

RUN R -e "install.packages('remotes'); library('remotes')"
RUN R -e "install.packages(c('usethis', 'pkgdown', 'rcmdcheck', 'roxygen2', 'rversions', 'urlchecker'))"

#RUN R -e 'install.packages("devtools");library(devtools)'
RUN R -e "install.packages('BiocManager'); library('BiocManager')"

RUN R -e "BiocManager::install('Rcpp'); library('Rcpp')"
RUN R -e "BiocManager::install('ggplot2'); library('ggplot2')"
RUN R -e "BiocManager::install('reshape2'); library('reshape2')"

RUN R -e "BiocManager::install('ggsci'); library('ggsci')"
RUN R -e "BiocManager::install('pheatmap'); library('pheatmap')"
RUN R -e "BiocManager::install('limma'); library('limma')"
RUN R -e "BiocManager::install('DT'); library('DT')"
RUN R -e "BiocManager::install('data.table'); library('data.table')"
RUN R -e "BiocManager::install('htmltools'); library('htmltools')"

RUN apt-get install -y libv8-dev
RUN R -e "BiocManager::install('randomcoloR'); library('randomcoloR')"

RUN R -e "BiocManager::install('knitr'); library('knitr')"
RUN R -e "BiocManager::install('RCurl'); library('RCurl')"

RUN apt-get install -y libxml2-dev
RUN R -e "BiocManager::install('kableExtra'); library('kableExtra')"
RUN R -e "BiocManager::install('digest'); library('digest')"
RUN R -e "BiocManager::install('ggExtra'); library('ggExtra')"
RUN R -e "BiocManager::install('ggpubr'); library('ggpubr')"
RUN R -e "BiocManager::install('patchwork'); library('patchwork')"
RUN R -e "BiocManager::install('dplyr'); library('dplyr')"

RUN R -e "BiocManager::install('GenomicRanges'); library('GenomicRanges')"

RUN apt-get install -y libharfbuzz-dev libfribidi-dev
RUN R -e "BiocManager::install('textshaping'); library('textshaping')"

RUN R -e "BiocManager::install('tidyverse'); library('tidyverse')"
RUN R -e "BiocManager::install('methylKit'); library('methylKit')"

RUN apt-get install -y libcairo2-dev libxt-dev
RUN R -e "BiocManager::install('Cairo'); library('Cairo')"
RUN R -e "BiocManager::install('minfi'); library('minfi')"

RUN apt-get install -y pandoc

RUN R -e "BiocManager::install('rmdformats'); library('rmdformats')"
