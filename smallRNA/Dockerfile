FROM shengqh/cqs_smallrnaseq:20220429

RUN R -e "BiocManager::install('remotes'); library('remotes')"
RUN R -e "BiocManager::install('yihui/knitr'); library('knitr')"

ARG SPCOUNT_VERSION="0.0.9"
RUN cd /opt; \
    git clone https://github.com/shengqh/spcount; \
    cd spcount; \
    pip3 install . ; \
    cd ..; \
    rm -rf spcount; \
    spcount -h
