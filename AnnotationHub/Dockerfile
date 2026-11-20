FROM bioconductor/bioconductor_docker:3.23-r-4.6.1

ARG UPDATE_DATE=20260814
RUN Rscript --slave --no-save --no-restore-history -e 'BiocManager::install(ask=F)'

RUN Rscript --slave --no-save --no-restore-history -e 'BiocManager::install("biomaRt", ask=F)'
RUN Rscript --slave --no-save --no-restore-history -e 'BiocManager::install("stringr", ask=F)'
RUN Rscript --slave --no-save --no-restore-history -e 'BiocManager::install("AnnotationHub", ask=F)'
RUN Rscript --slave --no-save --no-restore-history -e 'BiocManager::install("AnnotationFilter", ask=F)'
RUN Rscript --slave --no-save --no-restore-history -e 'BiocManager::install("ensembldb", ask=F)'

RUN mkdir -p /cache/AnnotationHub
ENV ANNOTATIONHUB_CACHE=/cache/AnnotationHub
RUN mkdir -p /app
COPY install_db.r /app
RUN Rscript --slave --no-save --no-restore-history /app/install_db.r
RUN ls /cache/AnnotationHub