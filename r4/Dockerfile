FROM r-base:4.4.2

RUN apt-get update -qq
RUN apt-get install -y libcurl4-openssl-dev libssl-dev libhdf5-dev librtmp-dev libfontconfig1-dev libxml2-dev

RUN R -e "Sys.setenv('R_REMOTES_NO_ERRORS_FROM_WARNINGS' = 'true')"
RUN R -e "if('BiocManager' %in% rownames(installed.packages()) == FALSE) {install.packages('BiocManager', update=FALSE, ask=FALSE, dependencies=TRUE)}"

RUN R -e "if('biomaRt' %in% rownames(installed.packages()) == FALSE) {BiocManager::install('biomaRt', update=FALSE, ask=FALSE, dependencies=TRUE)}"
RUN R -e "if('stringr' %in% rownames(installed.packages()) == FALSE) {BiocManager::install('stringr', update=FALSE, ask=FALSE, dependencies=TRUE)}"
RUN R -e "if('arsenal' %in% rownames(installed.packages()) == FALSE) {BiocManager::install('arsenal', update=FALSE, ask=FALSE, dependencies=TRUE)}"
RUN R -e "if('arsenal' %in% rownames(installed.packages()) == FALSE) {BiocManager::install('arsenal', update=FALSE, ask=FALSE, dependencies=TRUE)}"
