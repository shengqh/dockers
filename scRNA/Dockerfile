FROM r-base:4.1.3
#seurat not compatible with 4.2.0 yet

RUN apt-get update -qq
RUN apt-get install -y default-jre default-jdk
RUN apt-get install -y python3 python3-pip 

RUN apt-get install -y libhdf5-dev libcurl4-gnutls-dev librtmp-dev libssl-dev libfontconfig1-dev libxml2-dev libnlopt-dev
RUN apt-get install -y wget

RUN pip3 install umap-learn cna
RUN apt-get install -y automake cmake

RUN R -e "install.packages('BiocManager');library('BiocManager')"
RUN R -e "BiocManager::install(ask=FALSE)"
RUN R -e "BiocManager::install('remotes');library('remotes')"

RUN apt-get install -y libgeos-dev
RUN R -e "BiocManager::install('SeuratObject');library('SeuratObject')"
RUN R -e "BiocManager::install('Seurat');library('Seurat')"
RUN R -e "BiocManager::install('SignacX');library('SignacX')"

RUN R -e "BiocManager::install('xlsx');library('xlsx')"
RUN R -e "BiocManager::install('shiny');library('shiny')"
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

RUN R -e "install.packages(c('car'))"
RUN R -e "install.packages('ggpubr');library('ggpubr')"
RUN R -e "BiocManager::install('heatmap3');library('heatmap3')"

RUN R -e "BiocManager::install('limma');library('limma')"
RUN R -e "BiocManager::install('jdekanter/CHETAH');library('CHETAH')"

RUN R -e "BiocManager::install('edgeR');library('edgeR')"

RUN R -e "BiocManager::install('immunogenomics/harmony');library('harmony')"
RUN R -e "BiocManager::install('Rcpp');library('Rcpp')"

RUN R -e "BiocManager::install('ggdendro');library('ggdendro')"

RUN R -e "BiocManager::install('formatR');library('formatR')"

RUN R -e "BiocManager::install('immunomind/immunarch');library('immunarch')"

ENV cutoff_ver=20220208
RUN R -e "BiocManager::install('shengqh/cutoff');library('choisycutoff')"
RUN R -e "BiocManager::install('liuqivandy/scRNABatchQC');library('scRNABatchQC')"
RUN R -e "BiocManager::install('JiaLiVUMC/scMRMA');library('scMRMA')"

RUN R -e "BiocManager::install('glmGamPoi');library('glmGamPoi')"
RUN R -e "BiocManager::install('chris-mcginnis-ucsf/DoubletFinder');library('DoubletFinder')"
RUN R -e "BiocManager::install('VennDiagram');library('VennDiagram')"
RUN R -e "BiocManager::install('testit');library('testit')"

ARG PANDOC_VERSION="2.18"
RUN cd /opt; \
    wget https://github.com/jgm/pandoc/releases/download/${PANDOC_VERSION}/pandoc-${PANDOC_VERSION}-linux-amd64.tar.gz; \
    tar -xzvf pandoc-${PANDOC_VERSION}-linux-amd64.tar.gz; \
    rm pandoc-${PANDOC_VERSION}-linux-amd64.tar.gz
ENV PATH=/opt/pandoc-${PANDOC_VERSION}/bin:$PATH
RUN pandoc --version

COPY irtools.centos /usr/bin/irtools

RUN R -e "BiocManager::install('GUniFrac');library('GUniFrac')"

RUN pip3 install pysam
RUN pip3 install pandas

RUN cd /opt; \
    wget https://github.com/Illumina/strelka/releases/download/v2.9.10/strelka-2.9.10.centos6_x86_64.tar.bz2; \
    tar xvjf strelka-2.9.10.centos6_x86_64.tar.bz2; \
    rm strelka-2.9.10.centos6_x86_64.tar.bz2
ENV PATH=/opt/strelka-2.9.10.centos6_x86_64/bin/:$PATH

ENV GSEA_VERSION="4.3.2"
RUN cd /opt; \
    wget https://data.broadinstitute.org/gsea-msigdb/gsea/software/desktop/4.3/GSEA_Linux_${GSEA_VERSION}.zip ; \
    unzip GSEA_Linux_${GSEA_VERSION}.zip ; \
    rm GSEA_Linux_${GSEA_VERSION}.zip ;
ENV PATH=/opt/GSEA_Linux_${GSEA_VERSION}:$PATH

RUN apt update
RUN apt install -y git curl

ENV NGSPERL_VERSION="20221116"
RUN cd /opt; \
    git clone https://github.com/shengqh/ngsperl.git; \
    bash /opt/ngsperl/install_packages_nosudo.sh
ENV PERL5LIB=/opt/ngsperl/lib:$PERL5LIB
