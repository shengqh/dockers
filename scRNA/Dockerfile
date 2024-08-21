FROM shengqh/cqs_scrnaseq:20240813

RUN R -e 'BiocManager::install("shengqh/SignacX");library("SignacX")'
RUN R -e 'BiocManager::install("satijalab/azimuth");library("SignacX")'
RUN R -e 'BiocManager::install("SingleR");library("SingleR")'
RUN R -e 'BiocManager::install("celldex");library("celldex")'
