FROM r-base:4.5.2

RUN apt update
RUN apt install -y libcurl4-openssl-dev libxml2-dev libssl-dev libfontconfig1-dev libopenblas-dev
RUN apt install -y ghostscript fonts-freefont-otf librsvg2-bin libmagickcore-7.q16-10-extra imagemagick 

ARG PANDOC_VERSION="2.19.2"
ENV PATH=/opt/pandoc-${PANDOC_VERSION}/bin:$PATH
RUN cd /opt; \
    wget https://github.com/jgm/pandoc/releases/download/${PANDOC_VERSION}/pandoc-${PANDOC_VERSION}-linux-amd64.tar.gz; \
    tar -xzvf pandoc-${PANDOC_VERSION}-linux-amd64.tar.gz; \
    rm pandoc-${PANDOC_VERSION}-linux-amd64.tar.gz; \
    pandoc --version

RUN R -e "install.packages('BiocManager')"
RUN R -e "BiocManager::install('remotes'); library('remotes')"
RUN R -e "BiocManager::install('RCurl'); library('RCurl')"
RUN R -e "BiocManager::install('ComplexHeatmap'); library('ComplexHeatmap')"
RUN R -e "BiocManager::install('cowplot'); library('cowplot')"
RUN R -e "BiocManager::install('data.table'); library('data.table')"
RUN R -e "BiocManager::install('digest'); library('digest')"
RUN R -e "BiocManager::install('dplyr'); library('dplyr')"
RUN R -e "BiocManager::install('DT'); library('DT')"
RUN R -e "BiocManager::install('fgsea');library('fgsea')"
RUN R -e "BiocManager::install('ggExtra'); library('ggExtra')"
RUN R -e "BiocManager::install('ggplot2'); library('ggplot2')"
RUN R -e "BiocManager::install('grid'); library('grid')"
RUN R -e "BiocManager::install('htmltools'); library('htmltools')"
RUN R -e "BiocManager::install('httr'); library('httr')"

RUN apt install -y libharfbuzz-dev libfribidi-dev
RUN R -e "BiocManager::install('kableExtra'); library('kableExtra')"
RUN R -e "BiocManager::install('msigdbr');library('msigdbr')"
RUN R -e "BiocManager::install('patchwork'); library('patchwork')"
RUN R -e "BiocManager::install('reshape2'); library('reshape2')"
RUN R -e "BiocManager::install('rlist'); library('rlist')"
RUN R -e "BiocManager::install('rmdformats');library('rmdformats')"
RUN R -e "BiocManager::install('stringr'); library('stringr')"
RUN R -e "BiocManager::install('systemfonts'); library('systemfonts')"

RUN apt install -y libfreetype6-dev libpng-dev libtiff5-dev libjpeg-dev libwebp-dev
RUN R -e "BiocManager::install('ragg'); library('ragg')"

RUN apt install -y cmake
RUN R -e "BiocManager::install('tidyverse'); library('tidyverse')"

RUN R -e "BiocManager::install('tools'); library('tools')"
RUN R -e "BiocManager::install('XML'); library('XML')"
RUN R -e "BiocManager::install('yihui/knitr'); library('knitr')"
RUN R -e "BiocManager::install('ggpubr'); library('ggpubr')"
