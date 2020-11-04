FROM r-base

RUN mkdir /scratch 
RUN mkdir /data

RUN R -e "install.packages('BiocManager')"
#RUN R -e "BiocManager::install(c('optparse', 'shiny', 'rmarkdown', 'knitr','ggplot2', 'gridExtra', 'dplyr', 'reshape2', 'readr', 'data.table', 'heatmap3', 'GenomicRanges', 'openssl'), ask=F);"
#RUN R -e "BiocManager::install(c('Biostrings', 'Rsamtools', 'biomaRt', 'VennDiagram', 'cowplot'), ask=F)"
#RUN R -e "BiocManager::install(c('stringr', 'RColorBrewer', 'forcats', 'getopt', 'Cairo'), ask=F)"
#RUN R -e "BiocManager::install(c('pheatmap', 'R.utils', 'mclust'), ask=F)"
RUN R -e "BiocManager::install('remotes', ask=F)"
RUN R -e "BiocManager::install('PoisonAlien/maftools', ask=F)"

RUN apt-get update
RUN apt-get install -y curl
RUN apt-get install -y libcurl4-openssl-dev

RUN R -e "BiocManager::install('im3sanger/dndscv', ask=F)" 
RUN R -e "BiocManager::install('jokergoo/ComplexHeatmap', ask=F)"

RUN apt-get install -y libssl-dev

RUN R -e "BiocManager::install('openssl', ask=F)"
RUN R -e "BiocManager::install('httr', ask=F)"
RUN R -e "BiocManager::install('gh', ask=F)"
RUN R -e "BiocManager::install('usethis', ask=F)"
RUN R -e "library('usethis')"
RUN R -e "BiocManager::install('slzhao/mafreport', ask=F)"

RUN apt-get install -y pandoc

