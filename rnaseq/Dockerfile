FROM shengqh/bioinfo:base

RUN pip3 install --upgrade pip

RUN pip3 install biopython

RUN R -e "BiocManager::install(c('DESeq2', 'RColorBrewer', 'VennDiagram', 'colorRamps', 'cowplot', 'grid', 'lattice', 'plyr', 'reshape', 'scales', 'preprocessCore', 'edgeR', 'DT', 'kableExtra'))"

ARG STAR_VERSION="2.7.3a"
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

COPY gsea-3.0.jar /opt/
RUN java -cp /opt/gsea-3.0.jar xtools.gsea.GseaPreranked -help

ARG SUBREAD_VERSION="2.0.0"
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

RUN cd /opt; \
    wget https://data.broadinstitute.org/gsea-msigdb/gsea/software/desktop/4.0/GSEA_Linux_4.0.3.zip ; \
    unzip GSEA_Linux_4.0.3.zip ; \
    rm GSEA_Linux_4.0.3.zip ;
ENV PATH=/opt/GSEA_Linux_4.0.3:$PATH

COPY gatk3.jar /opt/
COPY picard.jar /opt/

ENV NGSPERL_VERSION="20200330"
RUN cd /opt; \
    git clone https://github.com/shengqh/ngsperl.git; \
    bash /opt/ngsperl/install_packages.sh
ENV PERL5LIB=/opt/ngsperl/lib:$PERL5LIB

RUN R -e "BiocManager::install(c('tidyverse'))"
RUN R -e "BiocManager::install(c('TCGAbiolinks'))"
RUN R -e "BiocManager::install()"
