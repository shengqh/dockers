FROM shengqh/bioinfo:java1.8.0_perl5.22.1

RUN cd /usr/bin && ln -s /bin/gzip gzip && ln -s /bin/tar tar

RUN echo "deb https://cloud.r-project.org/bin/linux/ubuntu xenial-cran35/ " >> /etc/apt/sources.list
RUN more /etc/apt/sources.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9

RUN apt-get update
RUN apt-get install -y r-base
RUN apt-get install -y r-base-dev

RUN R -e "install.packages(\"optparse\")"
RUN R -e "library(\"optparse\")"

RUN R -e "install.packages(\"shiny\")"
RUN R -e "library(\"shiny\")"

RUN R -e "install.packages(\"rmarkdown\")"
RUN R -e "library(\"rmarkdown\")"

RUN R -e "install.packages(\"knitr\")"
RUN R -e "library(\"knitr\")"

RUN R -e "install.packages(\"ggplot2\")"
RUN R -e "library(\"ggplot2\")"

RUN R -e "install.packages(\"gridExtra\")"
RUN R -e "library(\"gridExtra\")"

RUN R -e "install.packages(\"dplyr\")"
RUN R -e "library(\"dplyr\")"

RUN R -e "install.packages(\"reshape2\")"
RUN R -e "library(\"reshape2\")"

RUN R -e "install.packages(\"readr\")"
RUN R -e "library(\"readr\")"

RUN R -e "install.packages(\"data.table\")"
RUN R -e "library(\"data.table\")"

RUN R -e "install.packages(\"heatmap3\")"
RUN R -e "library(\"heatmap3\")"

RUN R -e "install.packages(\"BiocManager\")"
RUN R -e "library(\"BiocManager\")"

RUN R -e "BiocManager::install(\"GenomicRanges\")"
RUN R -e "library(\"GenomicRanges\")"

RUN R -e "BiocManager::install(ask=F)"

RUN R -e "install.packages(\"openssl\")"
RUN R -e "library(\"openssl\")"

RUN R -e "install.packages(\"devtools\")"
RUN R -e "library(\"devtools\")"

RUN R --version
