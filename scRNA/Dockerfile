FROM shengqh/bioinfo_base:20230514

ENV SKLEARN_ALLOW_DEPRECATED_SKLEARN_PACKAGE_INSTALL=True
RUN pip3 install pandas scipy numpy seaborn scikit-learn umap-learn install GMM-demux pysam cna scrublet

#have to install bbmle through stand install.packages rather than BiocManager::install
RUN R -e "BiocManager::install('SeuratObject', ask=FALSE);library('SeuratObject')" && \
 R -e "BiocManager::install('Seurat', ask=FALSE);library('Seurat')" && \
 R -e "BiocManager::install('SignacX', ask=FALSE);library('SignacX')" && \
 R -e "install.packages('bbmle', ask=FALSE);library('bbmle')" && \
 R -e "BiocManager::install('jdekanter/CHETAH', ask=FALSE);library('CHETAH')" && \
 R -e "BiocManager::install('immunogenomics/harmony', ask=FALSE);library('harmony')" && \
 R -e "BiocManager::install('immunomind/immunarch', ask=FALSE);library('immunarch')" && \
 R -e "BiocManager::install('shengqh/cutoff', ask=FALSE);library('choisycutoff')" && \
 R -e "BiocManager::install('rhdf5filters', ask=FALSE);library('rhdf5filters')" && \
 R -e "BiocManager::install('glmGamPoi', ask=FALSE);library('glmGamPoi')" && \
 R -e "BiocManager::install('chris-mcginnis-ucsf/DoubletFinder', ask=FALSE);library('DoubletFinder')" && \
 R -e "BiocManager::install('GUniFrac', ask=FALSE);library('GUniFrac')" && \
 R -e "BiocManager::install('DropletUtils', ask=FALSE);library('DropletUtils')" && \
 R -e "BiocManager::install('magick', ask=FALSE);library('magick')" && \
 R -e "BiocManager::install('campbio/celda', ask=FALSE);library('celda')" && \
 R -e "BiocManager::install('scDblFinder', ask=FALSE);library('scDblFinder')" && \
 R -e "BiocManager::install('Nebulosa', ask=FALSE);library('Nebulosa')" && \
 R -e "BiocManager::install('igordot/msigdbr', ask=FALSE);library('msigdbr')" && \
 R -e "BiocManager::install('YuLab-SMU/ggtree', ask=FALSE);library('ggtree')" && \
 R -e "BiocManager::install('singleCellTK', ask=FALSE);library('singleCellTK')" && \
 R -e "BiocManager::install('SingleR', ask=FALSE);library('SingleR')" && \
 R -e "BiocManager::install('scCustomize', ask=FALSE);library('scCustomize')" && \
 R -e "BiocManager::install('sctransform', force=TRUE, ask=FALSE);library('sctransform')" && \
 R -e "BiocManager::install('liuqivandy/scRNABatchQC', ask=FALSE);library('scRNABatchQC')" && \
 R -e "BiocManager::install('JiaLiVUMC/scMRMA', ask=FALSE);library('scMRMA')" && \
 R -e "BiocManager::install('biovizBase', ask=FALSE);library('biovizBase')" && \
 R -e "BiocManager::install('EnsDb.Hsapiens.v86', ask=FALSE);library('EnsDb.Hsapiens.v86')" && \
 R -e "devtools::install_github('GreenleafLab/ArchR', ref='master', repos = BiocManager::repositories(), ask=FALSE);library('ArchR')"

RUN R -e "BiocManager::install('bimberlab/cellhashR', ask=FALSE);library('cellhashR')"
RUN R -e "BiocManager::install('immunogenomics/presto', ask=FALSE);library('presto')"

ARG scDemultiplex_VERSION="20230523"
RUN R -e "BiocManager::install('shengqh/scDemultiplex', ask=FALSE);library('scDemultiplex')"

RUN cd /opt; \
    wget https://github.com/Illumina/strelka/releases/download/v2.9.10/strelka-2.9.10.centos6_x86_64.tar.bz2; \
    tar xvjf strelka-2.9.10.centos6_x86_64.tar.bz2; \
    rm strelka-2.9.10.centos6_x86_64.tar.bz2
ENV PATH=/opt/strelka-2.9.10.centos6_x86_64/bin/:$PATH

COPY irtools.centos /usr/bin/irtools
