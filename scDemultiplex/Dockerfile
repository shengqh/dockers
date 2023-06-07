FROM bioconductor/bioconductor_docker:RELEASE_3_17-R-4.3.0

RUN Rscript --slave --no-save --no-restore-history -e 'BiocManager::install(ask=F)'
RUN Rscript --slave --no-save --no-restore-history -e 'BiocManager::install(c("bbmle", "shengqh/cutoff", "rmdformats", "zoo", "R.utils", "reshape2", "data.table", "tictoc", "dplyr", "aricode"))'
RUN Rscript --slave --no-save --no-restore-history -e 'BiocManager::install(c("MarioniLab/DropletUtils", "Seurat", "demuxmix", "BimberLab/cellhashR", "shengqh/scDemultiplex"))'
RUN pip3 install GMM_Demux