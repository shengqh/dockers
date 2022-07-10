FROM immunomind/immunarch-docker:dev

# set the environment variables
ENV immunarch_ver 20220709

RUN R -e "install.packages('BiocManager'); library('BiocManager')"
RUN R -e "BiocManager::install('remotes'); library('remotes')"
RUN R -e "BiocManager::install('yihui/knitr'); library('knitr')"
RUN R -e "BiocManager::install('reshape2'); library('reshape2')"
RUN R -e "BiocManager::install('ggplot2'); library('ggplot2')"
RUN R -e "BiocManager::install('data.table'); library('data.table')"
RUN R -e "BiocManager::install('DT'); library('DT')"

RUN apt update
RUN apt install -y libcurl4-openssl-dev
RUN R -e "BiocManager::install('RCurl'); library('RCurl')"
RUN R -e "BiocManager::install('htmltools'); library('htmltools')"
RUN R -e "BiocManager::install('stringr'); library('stringr')"

RUN apt install -y libxml2-dev
RUN R -e "BiocManager::install('XML'); library('XML')"
RUN R -e "BiocManager::install('rlist'); library('rlist')"

RUN apt install -y libssl-dev
RUN R -e "BiocManager::install('httr'); library('httr')"

RUN apt install -y libfontconfig1-dev
RUN R -e "BiocManager::install('systemfonts'); library('systemfonts')"
RUN R -e "BiocManager::install('kableExtra'); library('kableExtra')"
RUN R -e "BiocManager::install('tidyverse'); library('tidyverse')"

ARG PANDOC_VERSION="2.18"
ENV PATH=/opt/pandoc-${PANDOC_VERSION}/bin:$PATH
RUN cd /opt; \
    wget https://github.com/jgm/pandoc/releases/download/${PANDOC_VERSION}/pandoc-${PANDOC_VERSION}-linux-amd64.tar.gz; \
    tar -xzvf pandoc-${PANDOC_VERSION}-linux-amd64.tar.gz; \
    rm pandoc-${PANDOC_VERSION}-linux-amd64.tar.gz; \
    pandoc --version

RUN apt install -y libopenblas-dev
RUN R -e "BiocManager::install('cowplot'); library('cowplot')"
