FROM shengqh/report:20240531

RUN R -e "BiocManager::install('arsenal');library('arsenal')"
RUN R -e "BiocManager::install('biomaRt');library('biomaRt')"
RUN R -e "BiocManager::install('qqman');library('qqman')"

#for reading gzipped file in data.table
RUN R -e "BiocManager::install('R.utils');library('R.utils')" 

#20250415
RUN R -e "BiocManager::install('kaustubhad/fastman');library('fastman')" 
RUN R -e "BiocManager::install(ask = FALSE)" 
