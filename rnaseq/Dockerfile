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

RUN pip3 install cutadapt==4.5

RUN apt-get install -y xxd

ARG STAR_VERSION="2.7.11a"
RUN cd /opt; \
    wget https://github.com/alexdobin/STAR/archive/${STAR_VERSION}.tar.gz; \
    tar -xzf ${STAR_VERSION}.tar.gz; \
    cd STAR-${STAR_VERSION}/source; \
    make STAR; \
    cp STAR /usr/local/bin; \
    cd ../..; \
    rm -rf STAR-${STAR_VERSION} ${STAR_VERSION}.tar.gz
RUN STAR --version

ARG FASTQC_VERSION="v0.12.1"
RUN cd /opt; \
    wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_${FASTQC_VERSION}.zip; \
    unzip fastqc_${FASTQC_VERSION}.zip; \
    rm fastqc_${FASTQC_VERSION}.zip; \
    chmod 755 FastQC/fastqc; \
    sed -i 's/250/5000/g' /opt/FastQC/fastqc

RUN R -e "BiocManager::install(ask=FALSE)"

ARG NGSPERL_VERSION="20231016"
RUN cd /opt/ngsperl; \
    git pull

