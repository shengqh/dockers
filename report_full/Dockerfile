FROM r-base:4.3.2

RUN mv /usr/lib/R/site-library/* /usr/local/lib/R/site-library; \
    rm -rf /usr/lib/R/site-library/; \
    ln -s /usr/local/lib/R/site-library /usr/lib/R/site-library

RUN apt-get update 
RUN apt-get install -y libcurl4-openssl-dev libssl-dev libxml2-dev \
  libfontconfig1-dev libopenblas-dev libcairo2-dev libharfbuzz-dev libfribidi-dev \
  libprotobuf-dev libgsl-dev librsvg2-bin libfreetype6-dev libpng-dev libtiff5-dev libjpeg-dev

RUN apt-get install -y automake ghostscript fonts-freefont-otf  \
  libmagickcore-6.q16-6-extra imagemagick 

ARG PANDOC_VERSION="3.1.11"
ENV PATH=/opt/pandoc-${PANDOC_VERSION}/bin:$PATH
RUN cd /opt; \
    wget https://github.com/jgm/pandoc/releases/download/${PANDOC_VERSION}/pandoc-${PANDOC_VERSION}-linux-amd64.tar.gz; \
    tar -xzvf pandoc-${PANDOC_VERSION}-linux-amd64.tar.gz; \
    rm pandoc-${PANDOC_VERSION}-linux-amd64.tar.gz; \
    pandoc --version

RUN R -e "install.packages('BiocManager'); library('BiocManager')"
RUN R -e "BiocManager::install('remotes'); library('remotes')"
RUN R -e "BiocManager::install('yihui/knitr'); library('knitr')"
RUN R -e "BiocManager::install('reshape2'); library('reshape2')"
RUN R -e "BiocManager::install('ggplot2'); library('ggplot2')"
RUN R -e "BiocManager::install('data.table'); library('data.table')"
RUN R -e "BiocManager::install('DT'); library('DT')"
RUN R -e "BiocManager::install('RCurl'); library('RCurl')"
RUN R -e "BiocManager::install('htmltools'); library('htmltools')"
RUN R -e "BiocManager::install('stringr'); library('stringr')"
RUN R -e "BiocManager::install('XML'); library('XML')"
RUN R -e "BiocManager::install('rlist'); library('rlist')"
RUN R -e "BiocManager::install('httr'); library('httr')"
RUN R -e "BiocManager::install('systemfonts'); library('systemfonts')"
RUN R -e "BiocManager::install('kableExtra'); library('kableExtra')"
RUN R -e "BiocManager::install('tidyverse'); library('tidyverse')"
RUN R -e "BiocManager::install('cowplot'); library('cowplot')"
RUN R -e "BiocManager::install('Seurat'); library('Seurat')"
RUN R -e "BiocManager::install('rmdformats');library('rmdformats')"
    
RUN R -e "BiocManager::install('formatR');library('formatR')"
RUN R -e "BiocManager::install('rjson');library('rjson')"

RUN apt-get install -y cmake

RUN R -e "BiocManager::install('ggpubr');library('ggpubr')"
RUN R -e "BiocManager::install('htmlTable');library('htmlTable')"
RUN R -e "BiocManager::install('ggExtra');library('ggExtra')"
RUN R -e "BiocManager::install('flextable');library('flextable')"

RUN apt-get install -y libv8-dev
RUN R -e "BiocManager::install('gtsummary');library('gtsummary')"

RUN R -e "BiocManager::install(ask=FALSE)"
