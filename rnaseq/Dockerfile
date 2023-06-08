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

RUN cd /opt; \
    wget https://github.com/COMBINE-lab/salmon/releases/download/v1.10.0/salmon-1.10.0_linux_x86_64.tar.gz ; \
    tar -xzvf salmon-1.10.0_linux_x86_64.tar.gz ; \
    rm salmon-1.10.0_linux_x86_64.tar.gz ;
ENV PATH=/opt/salmon-latest_linux_x86_64/bin:$PATH

ARG TODAY="20230607"
RUN R -e "BiocManager::install(ask=FALSE)"

RUN R -e "BiocManager::install('kevinblighe/EnhancedVolcano', ask=FALSE)"

ARG NGSPERL_VERSION="20230607"
RUN cd /opt/ngsperl; \
    git pull
