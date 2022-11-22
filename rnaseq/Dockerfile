FROM shengqh/cqs_rnaseq:20220418

ENV GSEA_VERSION="4.3.2"
RUN cd /opt; \
    wget https://data.broadinstitute.org/gsea-msigdb/gsea/software/desktop/4.3/GSEA_Linux_${GSEA_VERSION}.zip ; \
    unzip GSEA_Linux_${GSEA_VERSION}.zip ; \
    rm GSEA_Linux_${GSEA_VERSION}.zip ;
ENV PATH=/opt/GSEA_Linux_${GSEA_VERSION}:$PATH

ENV NGSPERL_VERSION="20221116"
RUN cd /opt/ngsperl; \
    git pull