FROM shengqh/bioinfo_base:20260828

#https://github.com/apache/arrow/issues/47202
ENV LIBARROW_BINARY=true
RUN apt-get update && \
    apt-get install -y \
      libthrift-dev \
      libudunits2-dev \
      libgdal-dev \
      libssl-dev \
      openssl && \
    rm -rf /var/lib/apt/lists/*

COPY MEcell_python /opt/MEcell_python
RUN pip install --no-cache-dir --upgrade \
      python-igraph \
      leidenalg \
      scvi-colab \
      sccoda \
      GMM-demux \
      pysam \
      cna \
      scrublet \
      numpy \
      scipy \
      scikit-learn \
      cupy-cuda12x==13.6.0 \
      pyproj \
      geopandas \
      pandas \
      tifffile \
      rasterio \
      shapely \
      ipykernel \
      imagecodecs
RUN cd /opt/MEcell_python && \
    pip3 install . && \
    cd .. && \
    rm -rf MEcell_python

RUN R -e "install.packages('bbmle', ask=FALSE);library('bbmle')"

RUN R -e 'install.packages("arrow", type = "source", repos = "https://packagemanager.rstudio.com/all/__linux__/focal/latest")'


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

# install cmdstanr package and install cmdstan into /usr/local/cmdstan
RUN R -e "install.packages('cmdstanr', repos = c('https://stan-dev.r-universe.dev/', getOption('repos')))"
RUN R -e "cmdstanr::check_cmdstan_toolchain(fix = TRUE)"
RUN R -e "cmdstanr::install_cmdstan(dir = '/usr/local', cores = 8)"

# adjust this if the version changes
ENV CMDSTAN=/usr/local/cmdstan-2.40.0
ENV PATH=$CMDSTAN/bin:$PATH
RUN stanc --version

RUN cd /opt && \
    git clone https://github.com/shengqh/silhouette.git && \
    cd silhouette && \
    sh build.sh && \
    mv silhouette /usr/bin/silhouette && \
    cd .. && \
    rm -rf silhouette && \
    chmod +x /usr/bin/silhouette 

RUN R -e "BiocManager::install('sctransform', force=TRUE, ask=FALSE);library('sctransform')" && \
    R -e "BiocManager::install('satijalab/seurat-object', ask=FALSE);library('SeuratObject')" && \
    R -e 'BiocManager::install("satijalab/seurat");library("Seurat")' && \
    R -e 'BiocManager::install("satijalab/seurat-data");library("SeuratData")' && \
    R -e 'BiocManager::install("satijalab/seurat-wrappers")' 

RUN R -e "BiocManager::install('wjawaid/enrichR', ask=FALSE);library('enrichR')" && \
    R -e "BiocManager::install('campbio/celda', ask=FALSE);library('celda')" && \
    R -e "BiocManager::install('shengqh/cutoff', ask=FALSE);library('choisycutoff')" && \
    R -e "BiocManager::install('rhdf5filters', ask=FALSE);library('rhdf5filters')" 
    
RUN R -e "BiocManager::install('glmGamPoi', ask=FALSE);library('glmGamPoi')" && \
    R -e "BiocManager::install('jdekanter/CHETAH', ask=FALSE);library('CHETAH')" && \
    R -e "BiocManager::install('immunogenomics/harmony', ask=FALSE);library('harmony')" && \
    R -e "BiocManager::install('immunomind/immunarch', ask=FALSE);library('immunarch')" && \
    R -e "BiocManager::install('chris-mcginnis-ucsf/DoubletFinder', ask=FALSE);library('DoubletFinder')" 

RUN R -e "BiocManager::install('GUniFrac', ask=FALSE);library('GUniFrac')" && \
    R -e "BiocManager::install('DropletUtils', ask=FALSE);library('DropletUtils')" && \
    R -e "BiocManager::install('magick', ask=FALSE);library('magick')" && \
    R -e "BiocManager::install('scDblFinder', ask=FALSE);library('scDblFinder')" && \
    R -e "BiocManager::install('Nebulosa', ask=FALSE);library('Nebulosa')" 
    
RUN R -e "BiocManager::install('igordot/msigdbr', ask=FALSE);library('msigdbr')" && \
    R -e "BiocManager::install('YuLab-SMU/ggtree', ask=FALSE);library('ggtree')" && \
    R -e "BiocManager::install('scCustomize', ask=FALSE);library('scCustomize')" && \
    R -e "BiocManager::install('sf', force=TRUE, ask=FALSE);library('sf')"
    
RUN R -e "BiocManager::install('biovizBase', ask=FALSE);library('biovizBase')" && \
    R -e "BiocManager::install('EnsDb.Hsapiens.v86', ask=FALSE);library('EnsDb.Hsapiens.v86')" && \
    R -e "BiocManager::install('immunogenomics/presto', ask=FALSE);library('presto')" && \
    R -e "BiocManager::install('demuxmix', ask=FALSE);library('demuxmix')" 
    
RUN R -e 'BiocManager::install("TFBSTools", type = "source", force = TRUE);library("TFBSTools")' && \
    R -e 'BiocManager::install("gtsummary");library("gtsummary")' && \
    R -e 'BiocManager::install("flextable");library("flextable")' && \
    R -e 'BiocManager::install("BSgenome.Hsapiens.UCSC.hg38");library("BSgenome.Hsapiens.UCSC.hg38")' && \
    R -e 'BiocManager::install("holab-hku/DCATS");library("DCATS")' 
 
RUN R -e 'BiocManager::install("SingleR");library("SingleR")' && \
    R -e 'BiocManager::install("SingleR-inc/celldex");library("celldex")' && \
    R -e "BiocManager::install('shengqh/scDemultiplex', ask=FALSE);library('scDemultiplex')" && \
    R -e 'BiocManager::install("MarioniLab/miloR");library("miloR")' && \
    R -e 'BiocManager::install("MarioniLab/miloDE");library("miloDE")' 

RUN R -e 'BiocManager::install("hdf5r");library("hdf5r")' && \
    R -e 'BiocManager::install("dmcable/spacexr");library("spacexr")' && \
    R -e 'BiocManager::install("lmweber/ggspavis");library("ggspavis")' && \
    R -e 'BiocManager::install("SingleCellExperiment");library("SingleCellExperiment")'
    
RUN R -e "BiocManager::install('logger', ask=FALSE);library('logger')" && \
    R -e "BiocManager::install('homologene', ask=FALSE);library('homologene')" && \
    R -e "BiocManager::install('AnnotationDbi', ask=FALSE);library('AnnotationDbi')" && \
    R -e "BiocManager::install('org.Mm.eg.db', ask=FALSE);library('org.Mm.eg.db')" && \
    R -e "BiocManager::install('org.Hs.eg.db', ask=FALSE);library('org.Hs.eg.db')"

RUN R -e "devtools::install_github('JEFworks-Lab/MERINGUE'); library('MERINGUE')" && \
    R -e "devtools::install_github('KlugerLab/ALRA'); library('ALRA')" && \
    R -e "devtools::install_github('zdebruine/RcppML'); library('RcppML')" && \
    R -e "devtools::install_github('jinworks/SpatialCellChat'); library('SpatialCellChat')" && \
    R -e "Sys.setenv(R_REMOTES_NO_ERRORS_FROM_WARNINGS=TRUE); install.packages('NMF'); library('NMF')"

RUN R -e "devtools::install_github('jokergoo/circlize'); library('circlize')" && \
    R -e "devtools::install_github('jokergoo/ComplexHeatmap'); library('ComplexHeatmap')" && \
    R -e "BiocManager::install('fgsea', ask=FALSE, force=TRUE);library('fgsea')" && \
    R -e "BiocManager::install('zellkonverter');library('zellkonverter')"

#20260325, install devel version to avoid error from Seurat slot instead of layer call, which is fixed in the devel version but not in the release version yet.
RUN R -e "BiocManager::install('compbiomed/singleCellTK', ref = 'devel', ask=FALSE);library('singleCellTK')"
RUN R -e "BiocManager::install('leidenbase', ask=FALSE);library('leidenbase')"


#20260515, install azimuth first, then roll back Signac to 1.1.6.0.
#otherwise Azimuth will throw error: object 'RunChromVAR' is not exported by 'namespace:Signac'
RUN git clone https://github.com/mojaveazure/seurat-disk.git && \
    R CMD INSTALL seurat-disk && \
    rm -rf seurat-disk && \
    R -e "library('SeuratDisk')"

RUN R -e "remotes::install_url('https://github.com/stuart-lab/signac/archive/refs/tags/1.16.0.tar.gz'); library('Signac')"
RUN R -e "install.packages(c('shinyBS', 'shinydashboard'));library('shinyBS');library('shinydashboard')"
RUN git clone https://github.com/da-bar/JASPAR2020.git && \
    R CMD INSTALL JASPAR2020 && \
    rm -rf JASPAR2020 && \
    R -e "library('JASPAR2020')"

RUN git clone https://github.com/satijalab/azimuth.git && \
    R CMD INSTALL azimuth && \
    rm -rf azimuth && \
    R -e "library('Azimuth')"

RUN mkdir -p /opt/sccomp_models
RUN R -e "remotes::install_url('https://github.com/MangiolaLaboratory/sccomp/archive/refs/tags/v2.1.34.tar.gz', ask=FALSE);library('sccomp')"
RUN R -e "library('sccomp'); \
          model1 = sccomp:::load_model('glm_multi_beta_binomial', cache_dir='/opt/sccomp_models', force = TRUE, threads = 8); \
          model2 = sccomp:::load_model('glm_multi_beta_binomial_generate_data', cache_dir='/opt/sccomp_models', force = TRUE, threads = 8); \
          model3 = sccomp:::load_model('glm_multi_beta_binomial_simulate_data', cache_dir='/opt/sccomp_models', force = TRUE, threads = 8)"
RUN ls -l /opt/sccomp_models/2.1.34

#The original cellchat package has a bug in visualization, which is fixed in the forked version. So we install the forked version here.
#RUN R -e "devtools::install_github('jinworks/CellChat')"
RUN R -e "BiocManager::install('shengqh/CellChat', ask=FALSE);library('CellChat')"

#grr is required by Matrix.utils, which is required by scRNABatchQC. 
RUN R -e "remotes::install_url('https://github.com/cran/grr/archive/refs/tags/0.9.5.tar.gz', ask=FALSE);library('grr');remotes::install_url('https://github.com/cran/Matrix.utils/archive/refs/tags/0.9.8.tar.gz', ask=FALSE); library('Matrix.utils')"
RUN R -e "BiocManager::install('liuqivandy/scRNABatchQC', ask=FALSE);library('scRNABatchQC')"

RUN R -e "BiocManager::install('JiaLiVUMC/scMRMA', ask=FALSE);library('scMRMA')" 
RUN R -e "BiocManager::install('shengqh/SignacX');library('SignacX')"
#20260408, install multi-thread MEcell, which is much faster than the original version.
RUN R -e "BiocManager::install('liuqivandy/MEcell', ask=FALSE);library('MEcell')"
RUN R -e "BiocManager::install('liuqivandy/SpaGene', ask=FALSE);library('SpaGene')"

#motifmatchr use c++11, but we have C++14, so we need to set the CXXFLAGS to use gnu++14 standard.
ENV PKG_CXXFLAGS="-std=gnu++14"
RUN R -e "BiocManager::install('motifmatchr', ask=FALSE, update=FALSE)"
RUN R -e "devtools::install_github('GreenleafLab/ArchR', ref='master', repos = BiocManager::repositories(), ask=FALSE);library('ArchR')"

RUN R -e "BiocManager::install('C-HW/GLIMES', ask=FALSE, update=FALSE);library('GLIMES')"
RUN R -e "BiocManager::install('Danko-Lab/BayesPrism/BayesPrism', ask=FALSE, update=FALSE);library('BayesPrism')"

RUN mkdir -p /opt/sccomp_models
RUN R -e "BiocManager::install('MangiolaLaboratory/sccomp', ask=FALSE);library('sccomp')"
RUN R -e "library('sccomp'); \
          model1 = sccomp:::load_model('glm_multi_beta_binomial', cache_dir='/opt/sccomp_models', force = TRUE, threads = 8); \
          model2 = sccomp:::load_model('glm_multi_beta_binomial_generate_data', cache_dir='/opt/sccomp_models', force = TRUE, threads = 8); \
          model3 = sccomp:::load_model('glm_multi_beta_binomial_simulate_data', cache_dir='/opt/sccomp_models', force = TRUE, threads = 8)"
RUN ls -l /opt/sccomp_models/*

RUN echo "$CMDSTAN/stan/lib/stan_math/lib/tbb" > /etc/ld.so.conf.d/cmdstan-tbb.conf && ldconfig

# Install radian
RUN pip3 install --no-cache-dir radian

# Install languageserver for VS Code
RUN R -e "install.packages('languageserver', repos='https://cloud.r-project.org');library('languageserver')"
RUN R -e "install.packages('jgd', repos = 'https://reditorsupport.r-universe.dev');library('jgd')"
RUN R -e "install.packages('sess', repos = c('https://reditorsupport.r-universe.dev', getOption('repos')));library('sess')"
RUN curl --proto '=https' --tlsv1.2 -LsSf https://github.com/eitsupi/arf/releases/download/v0.6.0/arf-console-installer.sh | sh

# 20261109 Seurat V6
RUN R -e "BiocManager::install('satijalab/seurat', ask=FALSE);library('Seurat')"
