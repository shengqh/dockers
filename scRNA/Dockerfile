FROM shengqh/bioinfo:base

RUN pip3 install umap-learn

RUN R -e "BiocManager::install('Seurat')"
RUN R -e "BiocManager::install('remotes');library('remotes')"
RUN R -e "BiocManager::install('choisy/cutoff');library('cutoff')"
RUN R -e "BiocManager::install('ggExtra');library('ggExtra')"

RUN apt-get update
RUN apt-get install -y libhdf5-dev
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
#RUN R -e "BiocManager::install('satijalab/seurat');library('seurat')"

