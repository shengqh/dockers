FROM ubuntu:20.04

RUN apt-get update -qq
RUN apt-get install -y default-jre default-jdk
RUN apt-get install -y python3 python3-pip
RUN pip3 install umap-learn
RUN apt-get install -y libhdf5-dev libcurl4-gnutls-dev librtmp-dev libssl-dev libfontconfig1-dev libxml2-dev
RUN apt-get install -y wget

ARG PANDOC_VERSION="2.14.0.3"
RUN cd /opt; \
    wget https://github.com/jgm/pandoc/releases/download/${PANDOC_VERSION}/pandoc-${PANDOC_VERSION}-linux-amd64.tar.gz; \
    tar -xzvf pandoc-${PANDOC_VERSION}-linux-amd64.tar.gz; \
    rm pandoc-${PANDOC_VERSION}-linux-amd64.tar.gz
ENV PATH=/opt/pandoc-${PANDOC_VERSION}/bin:$PATH
RUN pandoc --version

# install two helper packages we need
RUN apt-get install -y --no-install-recommends software-properties-common dirmngr
# import the signing key (by Michael Rutter) for these repo
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
# add the R 4.0 repo from CRAN -- adjust 'focal' to 'groovy' or 'bionic' as needed
RUN add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"
RUN add-apt-repository ppa:c2d4u.team/c2d4u4.0+
RUN apt-get install -y r-base

Run R -e "install.packages('BiocManager');library('BiocManager')"
RUN R -e "BiocManager::install('xlsx');library('xlsx')"
RUN R -e "BiocManager::install('Seurat');library('Seurat')"
RUN R -e "BiocManager::install('remotes');library('remotes')"
RUN R -e "BiocManager::install('ggExtra');library('ggExtra')"
RUN R -e "BiocManager::install('hdf5r');library(hdf5r)"

#have to install bbmle through stand install.packages rather than BiocManager::install
RUN R -e "install.packages('bbmle');library('bbmle')"
RUN R -e "install.packages('knitr');library('knitr')"
RUN R -e "install.packages('rmarkdown');library('rmarkdown')"
RUN R -e "install.packages('rmdformats');library('rmdformats')"
RUN R -e "install.packages('DT');library('DT')"
RUN R -e "install.packages('RCurl');library('RCurl')"
RUN R -e "install.packages('kableExtra');library('kableExtra')"
RUN R -e "install.packages('ggpubr');library('ggpubr')"
RUN R -e "install.packages('heatmap3');library('heatmap3')"

RUN R -e "BiocManager::install('limma');library('limma')"
RUN R -e "BiocManager::install('CHETAH');library('CHETAH')"
RUN R -e "install.packages('SignacX');library('SignacX')"

RUN R -e "BiocManager::install('liuqivandy/scRNABatchQC');library('scRNABatchQC')"
RUN R -e "BiocManager::install('edgeR');library('edgeR')"

RUN R -e "BiocManager::install('immunogenomics/harmony');library('harmony')"
RUN R -e "BiocManager::install('Rcpp');library('Rcpp')"
RUN R -e "BiocManager::install(ask=FALSE)"

RUN R -e "BiocManager::install('ggdendro');library('ggdendro')"

RUN R -e "BiocManager::install('shengqh/cutoff');library('choisycutoff')"

RUN pip3 install cna
