FROM ubuntu:16.04

RUN mkdir /scratch /data 

RUN apt-get update
RUN apt-get install -y apt-transport-https ca-certificates libxml2-dev libcurl4-openssl-dev apt-utils

RUN echo "deb https://cloud.r-project.org/bin/linux/ubuntu xenial-cran35/ " >> /etc/apt/sources.list
RUN more /etc/apt/sources.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9

RUN apt-get update
RUN apt-get install -y r-base
RUN apt-get install -y r-base-dev

RUN R -e "install.packages(c(\"optparse\", \"rmarkdown\", \"knitr\", \"ggplot2\", \"gridExtra\"))"
RUN R -e "if (!requireNamespace(\"BiocManager\", quietly = TRUE)) install.packages(\"BiocManager\")"
RUN R -e "BiocManager::install(\"GenomicRanges\")"
RUN R -e "BiocManager::install(\"DESeq2\")"
RUN R -e "BiocManager::install(ask=F)"

CMD ["R"]
