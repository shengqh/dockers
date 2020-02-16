FROM shengqh/bioinfo:base

RUN pip3 install --upgrade pip

RUN pip3 install biopython

RUN R -e "BiocManager::install(c('DESeq2', 'RColorBrewer', 'VennDiagram', 'colorRamps', 'cowplot', 'grid', 'lattice', 'plyr', 'reshape', 'scales', 'preprocessCore', 'edgeR', 'DT', 'kableExtra'))"

ARG STAR_VERSION="2.7.2b"
RUN cd /opt; \
    wget https://github.com/alexdobin/STAR/archive/${STAR_VERSION}.tar.gz; \
    tar -xzf ${STAR_VERSION}.tar.gz; \
    cd STAR-${STAR_VERSION}/source; \
    make STAR; \
    cp STAR /usr/local/bin; \
    cd ../..; \
    rm -rf STAR-${STAR_VERSION} ${STAR_VERSION}.tar.gz
RUN STAR --version

RUN R -e "BiocManager::install('slzhao/KEGGprofile')"
RUN R -e "BiocManager::install('shengqh/WebGestaltR')"

COPY gsea-3.0.jar /opt/
RUN java -cp /opt/gsea-3.0.jar xtools.gsea.GseaPreranked -help

ARG SUBREAD_VERSION="1.6.4"
RUN cd /opt; \
    wget -O subread-${SUBREAD_VERSION}-Linux-x86_64.tar.gz https://sourceforge.net/projects/subread/files/subread-${SUBREAD_VERSION}/subread-${SUBREAD_VERSION}-Linux-x86_64.tar.gz/download; \
    tar -xzvf subread-${SUBREAD_VERSION}-Linux-x86_64.tar.gz; \
    rm subread-${SUBREAD_VERSION}-Linux-x86_64.tar.gz;
ENV PATH=/opt/subread-${SUBREAD_VERSION}-Linux-x86_64/bin:$PATH
RUN featureCounts -v

RUN cd /opt; \
    git clone https://github.com/slzhao/QC3.git; \
    chmod 755 /opt/QC3/qc3.pl
ENV PATH=/opt/QC3:$PATH

ENV SAMBAMBA_VERSION="0.7.0"
RUN wget https://github.com/biod/sambamba/releases/download/v${SAMBAMBA_VERSION}/sambamba-${SAMBAMBA_VERSION}-linux-static.gz ; \
    gunzip sambamba-${SAMBAMBA_VERSION}-linux-static.gz ; \
    chmod 755 sambamba-${SAMBAMBA_VERSION}-linux-static ; \
    mv sambamba-${SAMBAMBA_VERSION}-linux-static /usr/bin/sambamba
RUN sambamba --version

RUN cd /opt; \
    wget https://data.broadinstitute.org/gsea-msigdb/gsea/software/desktop/4.0/GSEA_Linux_4.0.3.zip ; \
    unzip GSEA_Linux_4.0.3.zip ; \
    rm GSEA_Linux_4.0.3.zip ;
ENV PATH=/opt/GSEA_Linux_4.0.3:$PATH

COPY gatk3.jar /opt/
COPY picard.jar /opt/
