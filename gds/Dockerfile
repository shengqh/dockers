FROM r-base:4.3.2

RUN R -e "install.packages('BiocManager', repos='http://cran.rstudio.com/')"

RUN R -e "BiocManager::install('gdsfmt')"
RUN R -e "library('gdsfmt')"

RUN apt-get update; apt-get install -y libcurl4-openssl-dev libxml2-dev

RUN R -e "BiocManager::install('SeqArray');library('SeqArray')"
RUN R -e "BiocManager::install('digest');library('digest')"

