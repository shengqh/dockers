FROM shengqh/bioinfo:java1.8.0_perl5.22.1

RUN cd /usr/bin && ln -s /bin/gzip gzip && ln -s /bin/tar tar

RUN echo "deb https://cloud.r-project.org/bin/linux/ubuntu xenial-cran35/ " >> /etc/apt/sources.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9

RUN apt-get update && apt-get install -y --allow-unauthenticated r-base r-base-dev

RUN R -e "install.packages('BiocManager'); BiocManager::install(c('optparse', 'shiny', 'rmarkdown', 'knitr','ggplot2', 'gridExtra', 'dplyr', 'reshape2', 'readr', 'data.table', 'heatmap3', 'GenomicRanges', 'openssl'), ask=F);"
