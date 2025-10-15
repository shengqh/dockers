FROM shengqh/bioinfo_base:20250905

RUN pip install --no-cache-dir --upgrade \
  scvi-colab sccoda GMM-demux pysam cna scrublet

RUN R -e "install.packages('bbmle', ask=FALSE);library('bbmle')"

#https://github.com/apache/arrow/issues/47202
ENV LIBARROW_BINARY=true
RUN apt-get update && apt-get install -y libthrift-dev
RUN R -e 'install.packages("arrow", type = "source", repos = "https://packagemanager.rstudio.com/all/__linux__/focal/latest")'

RUN R -e "BiocManager::install('SeuratObject', ask=FALSE);library('SeuratObject')" && \
    R -e "BiocManager::install('sctransform', force=TRUE, ask=FALSE);library('sctransform')" && \
    R -e 'BiocManager::install("satijalab/seurat");library("Seurat")' && \
    R -e 'BiocManager::install("satijalab/seurat-data");library("SeuratData")' && \
    R -e 'BiocManager::install("satijalab/azimuth");library("Azimuth")' && \
    R -e 'BiocManager::install("satijalab/seurat-wrappers")' && \
    R -e "BiocManager::install('wjawaid/enrichR', ask=FALSE);library('enrichR')" && \
    R -e "BiocManager::install('campbio/celda', ask=FALSE);library('celda')" && \
    R -e "BiocManager::install('shengqh/cutoff', ask=FALSE);library('choisycutoff')" && \
    R -e "BiocManager::install('rhdf5filters', ask=FALSE);library('rhdf5filters')" && \
    R -e "BiocManager::install('glmGamPoi', ask=FALSE);library('glmGamPoi')" && \
    R -e "BiocManager::install('jdekanter/CHETAH', ask=FALSE);library('CHETAH')" && \
    R -e "BiocManager::install('immunogenomics/harmony', ask=FALSE);library('harmony')" && \
    R -e "BiocManager::install('immunomind/immunarch', ask=FALSE);library('immunarch')" && \
    R -e "BiocManager::install('chris-mcginnis-ucsf/DoubletFinder', ask=FALSE);library('DoubletFinder')" && \
    R -e "BiocManager::install('GUniFrac', ask=FALSE);library('GUniFrac')" && \
    R -e "BiocManager::install('DropletUtils', ask=FALSE);library('DropletUtils')" && \
    R -e "BiocManager::install('magick', ask=FALSE);library('magick')" && \
    R -e "BiocManager::install('scDblFinder', ask=FALSE);library('scDblFinder')" && \
    R -e "BiocManager::install('Nebulosa', ask=FALSE);library('Nebulosa')" && \
    R -e "BiocManager::install('igordot/msigdbr', ask=FALSE);library('msigdbr')" && \
    R -e "BiocManager::install('YuLab-SMU/ggtree', ask=FALSE);library('ggtree')" && \
    R -e "BiocManager::install('singleCellTK', ask=FALSE);library('singleCellTK')" && \
    R -e "BiocManager::install('scCustomize', ask=FALSE);library('scCustomize')" && \
    R -e "BiocManager::install('liuqivandy/scRNABatchQC', ask=FALSE);library('scRNABatchQC')" && \
    R -e "BiocManager::install('JiaLiVUMC/scMRMA', ask=FALSE);library('scMRMA')" && \
    R -e "BiocManager::install('biovizBase', ask=FALSE);library('biovizBase')" && \
    R -e "BiocManager::install('EnsDb.Hsapiens.v86', ask=FALSE);library('EnsDb.Hsapiens.v86')" && \
    R -e "devtools::install_github('GreenleafLab/ArchR', ref='master', repos = BiocManager::repositories(), ask=FALSE);library('ArchR')" && \
    R -e "BiocManager::install('immunogenomics/presto', ask=FALSE);library('presto')" && \
    R -e "BiocManager::install('demuxmix', ask=FALSE);library('demuxmix')" && \
    R -e 'BiocManager::install("TFBSTools", type = "source", force = TRUE);library("TFBSTools")' && \
    R -e 'BiocManager::install("stuart-lab/signac");library("Signac")' && \
    R -e 'BiocManager::install("gtsummary");library("gtsummary")' && \
    R -e 'BiocManager::install("flextable");library("flextable")' && \
    R -e 'BiocManager::install("BSgenome.Hsapiens.UCSC.hg38");library("BSgenome.Hsapiens.UCSC.hg38")' && \
    R -e 'BiocManager::install("holab-hku/DCATS");library("DCATS")' && \
    R -e 'BiocManager::install("shengqh/SignacX");library("SignacX")' && \
    R -e 'BiocManager::install("SingleR");library("SingleR")' && \
    R -e 'BiocManager::install("SingleR-inc/celldex");library("celldex")' && \
    R -e "BiocManager::install('shengqh/scDemultiplex', ask=FALSE);library('scDemultiplex')" && \
    R -e 'BiocManager::install("MarioniLab/miloR");library("miloR")' && \
    R -e 'BiocManager::install("MarioniLab/miloDE");library("miloDE")' && \
    R -e 'BiocManager::install("hdf5r");library("hdf5r")' && \
    R -e 'BiocManager::install("dmcable/spacexr");library("spacexr")' && \
    R -e 'BiocManager::install("lmweber/ggspavis");library("ggspavis")' && \
    R -e 'BiocManager::install("SingleCellExperiment");library("SingleCellExperiment")'

RUN cd /opt && \
  git clone https://github.com/NMikolajewicz/scMiko.git && \
  R -e "devtools::install('/opt/scMiko');library('scMiko')"
RUN rm -rf /opt/scMiko

RUN cd /opt; \
    wget https://github.com/Illumina/strelka/releases/download/v2.9.10/strelka-2.9.10.centos6_x86_64.tar.bz2; \
    tar xvjf strelka-2.9.10.centos6_x86_64.tar.bz2; \
    rm strelka-2.9.10.centos6_x86_64.tar.bz2
ENV PATH=/opt/strelka-2.9.10.centos6_x86_64/bin/:$PATH

COPY irtools.centos /usr/bin/irtools

# set locale, without this, R code may not handle unicode character correctly
RUN apt-get update && \
  apt-get install -y locales && \
  locale-gen en_US.UTF-8 && \
  update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8
