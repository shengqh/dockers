FROM shengqh/cqs_rnaseq:20220418

ENV GSEA_VERSION="4.3.2"
RUN cd /opt; \
    wget https://data.broadinstitute.org/gsea-msigdb/gsea/software/desktop/4.3/GSEA_Linux_${GSEA_VERSION}.zip ; \
    unzip GSEA_Linux_${GSEA_VERSION}.zip ; \
    rm GSEA_Linux_${GSEA_VERSION}.zip ;
ENV PATH=/opt/GSEA_Linux_${GSEA_VERSION}:$PATH

RUN R -e "BiocManager::install('rmdformats');library('rmdformats')"

RUN R -e "BiocManager::install('igordot/msigdbr', ask=FALSE);library('msigdbr')"

RUN R -e "BiocManager::install('bzhanglab/WebGestaltR', ask=FALSE);library('WebGestaltR')"

ENV NGSPERL_VERSION="20230214"
RUN cd /opt/ngsperl; \
    git pull
