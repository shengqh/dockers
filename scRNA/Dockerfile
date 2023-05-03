FROM python:3.10.11

RUN apt update && apt install -y apt-utils && apt upgrade -y
RUN pip install --upgrade pip

ENV SKLEARN_ALLOW_DEPRECATED_SKLEARN_PACKAGE_INSTALL=True
RUN pip3 install pandas scipy numpy seaborn scikit-learn umap-learn
RUN pip3 install GMM-demux pysam cna

RUN apt-get install -y imagemagick libmagick++-dev libhdf5-dev libcurl4-gnutls-dev librtmp-dev libfontconfig1-dev libxml2-dev libnlopt-dev libfftw3-dev libfftw3-doc libgeos-dev libharfbuzz-dev libfribidi-dev libfreetype6-dev libpng-dev libtiff5-dev libjpeg-dev 

RUN gpg --keyserver keyserver.ubuntu.com --recv-key '95C0FAF38DB3CCAD0C080A7BDC78B2DDEABC47B7'
RUN gpg --armor --export '95C0FAF38DB3CCAD0C080A7BDC78B2DDEABC47B7' | tee /etc/apt/trusted.gpg.d/cran_debian_key.asc
RUN echo "deb http://cloud.r-project.org/bin/linux/debian bullseye-cran40/" | tee /etc/apt/sources.list.d/r.list
RUN apt update; apt install -y r-base; R --version

RUN apt-get install -y wget automake cmake git curl
RUN apt-get install -y default-jre default-jdk

RUN R -e "install.packages('BiocManager');library('BiocManager')"
RUN R -e "BiocManager::install(ask=FALSE)"
RUN R -e "BiocManager::install('remotes');library('remotes')"

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

RUN R -e "BiocManager::install('textshaping', ask=FALSE);library('textshaping')"
RUN R -e "BiocManager::install('ragg', ask=FALSE);library('ragg')"
RUN R -e "BiocManager::install('pkgdown', ask=FALSE);library('pkgdown')"
RUN R -e "BiocManager::install('devtools', ask=FALSE);library('devtools')"
RUN R -e "BiocManager::install('tictoc', ask=FALSE);library('tictoc')"

RUN apt-get install -y libzstd-dev
RUN R -e "BiocManager::install('rhdf5filters');library('rhdf5filters')"
RUN R -e "BiocManager::install('glmGamPoi');library('glmGamPoi')"
RUN R -e "BiocManager::install('chris-mcginnis-ucsf/DoubletFinder');library('DoubletFinder')"
RUN R -e "BiocManager::install('VennDiagram');library('VennDiagram')"
RUN R -e "BiocManager::install('testit');library('testit')"

COPY irtools.centos /usr/bin/irtools

RUN R -e "BiocManager::install('GUniFrac');library('GUniFrac')"

RUN R -e "BiocManager::install('clustree');library('clustree')"
RUN R -e "BiocManager::install('mclust');library('mclust')"

RUN R -e "BiocManager::install(ask=FALSE)"
RUN R -e "BiocManager::install('DropletUtils', ask=FALSE);library('DropletUtils')"

RUN R -e "BiocManager::install('magick', ask=FALSE);library('magick')"
RUN R -e "BiocManager::install('campbio/celda', ask=FALSE);library('celda')"

RUN R -e "BiocManager::install('scDblFinder', ask=FALSE);library('scDblFinder')"
RUN R -e "BiocManager::install('Nebulosa', ask=FALSE);library('Nebulosa')"

RUN R -e "BiocManager::install('igordot/msigdbr', ask=FALSE);library('msigdbr')"

RUN R -e "BiocManager::install('bzhanglab/WebGestaltR', ask=FALSE);library('WebGestaltR')"

RUN R -e "BiocManager::install('qqconf', ask=FALSE);library('qqconf')"
RUN R -e "BiocManager::install('YuLab-SMU/ggtree', ask=FALSE);library('ggtree')"
RUN R -e "BiocManager::install('singleCellTK', ask=FALSE);library('singleCellTK')"

RUN R -e "BiocManager::install('SingleR', ask=FALSE);library('SingleR')"
RUN R -e "BiocManager::install('scCustomize', ask=FALSE);library('scCustomize')"

RUN R -e "BiocManager::install('sctransform', force=TRUE, ask=FALSE);library('sctransform')"
RUN R -e "BiocManager::install('Seurat', force=TRUE, ask=FALSE);library('Seurat')"

RUN R -e "BiocManager::install('cvarrichio/Matrix.utils', force=TRUE, ask=FALSE);library('Matrix.utils')"

RUN R -e "BiocManager::install('liuqivandy/scRNABatchQC');library('scRNABatchQC')"
RUN R -e "BiocManager::install('JiaLiVUMC/scMRMA');library('scMRMA')"

ENV scDemultiplex_VERSION="20230116_v2"
RUN R -e "BiocManager::install('shengqh/scDemultiplex', ask=FALSE);library('scDemultiplex')"

ARG PANDOC_VERSION="2.18"
RUN cd /opt; \
    wget https://github.com/jgm/pandoc/releases/download/${PANDOC_VERSION}/pandoc-${PANDOC_VERSION}-linux-amd64.tar.gz; \
    tar -xzvf pandoc-${PANDOC_VERSION}-linux-amd64.tar.gz; \
    rm pandoc-${PANDOC_VERSION}-linux-amd64.tar.gz
ENV PATH=/opt/pandoc-${PANDOC_VERSION}/bin:$PATH
RUN pandoc --version

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

ENV NGSPERL_VERSION="20230426"
RUN cd /opt; \
    git clone https://github.com/shengqh/ngsperl.git; \
    bash /opt/ngsperl/install_packages_nosudo.sh
ENV PERL5LIB=/opt/ngsperl/lib:$PERL5LIB


