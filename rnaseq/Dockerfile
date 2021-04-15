FROM shengqh/bioinfo:base

RUN pip3 install --upgrade pip

RUN pip3 install biopython

ARG STAR_VERSION="2.7.8a"
RUN cd /opt; \
    wget https://github.com/alexdobin/STAR/archive/${STAR_VERSION}.tar.gz; \
    tar -xzf ${STAR_VERSION}.tar.gz; \
    cd STAR-${STAR_VERSION}/source; \
    make STAR; \
    cp STAR /usr/local/bin; \
    cd ../..; \
    rm -rf STAR-${STAR_VERSION} ${STAR_VERSION}.tar.gz
RUN STAR --version

ARG STAR_FUSION_VERSION="v1.10.0"
RUN cd /opt; \
    wget https://github.com/STAR-Fusion/STAR-Fusion/releases/download/${STAR_FUSION_VERSION}/STAR-Fusion-${STAR_FUSION_VERSION}.FULL.tar.gz; \
    tar -xzf STAR-Fusion-${STAR_FUSION_VERSION}.FULL.tar.gz; \
    rm STAR-Fusion-${STAR_FUSION_VERSION}.FULL.tar.gz
ENV PATH=/opt/STAR-Fusion-${STAR_FUSION_VERSION}:$PATH
RUN STAR-Fusion --version

COPY gsea-3.0.jar /opt/
RUN java -cp /opt/gsea-3.0.jar xtools.gsea.GseaPreranked -help

ARG SUBREAD_VERSION="2.0.2"
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
    wget https://data.broadinstitute.org/gsea-msigdb/gsea/software/desktop/4.1/GSEA_Linux_4.1.0.zip ; \
    unzip GSEA_Linux_4.1.0.zip ; \
    rm GSEA_Linux_4.1.0.zip ;
ENV PATH=/opt/GSEA_Linux_4.1.0:$PATH

COPY gatk3.jar /opt/
COPY picard.jar /opt/

RUN apt-get update && apt-get install -y libcairo2-dev

RUN R -e "BiocManager::install(c('DESeq2', 'RColorBrewer', 'VennDiagram', 'colorRamps', 'cowplot', 'grid', 'lattice', 'plyr', 'reshape', 'scales', 'preprocessCore', 'edgeR', 'DT', 'kableExtra'))"
RUN R -e "BiocManager::install('remotes');library('remotes')"
RUN R -e "BiocManager::install('slzhao/KEGGprofile');library('KEGGprofile')"
RUN R -e "BiocManager::install('tidyverse');library('tidyverse')"
RUN R -e "BiocManager::install('TCGAbiolinks');library('TCGAbiolinks')"
RUN R -e "BiocManager::install('WebGestaltR');library('WebGestaltR')"
RUN R -e "BiocManager::install()"

ENV NGSPERL_VERSION="20210331"
RUN cd /opt; \
    git clone https://github.com/shengqh/ngsperl.git; \
    bash /opt/ngsperl/install_packages_nosudo.sh
ENV PERL5LIB=/opt/ngsperl/lib:$PERL5LIB

RUN R -e "BiocManager::install('heatmap3');library('heatmap3')"
ENV NGSPERL_VERSION="20210413"
RUN cd /opt/ngsperl; \
    git pull
