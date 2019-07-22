FROM shengqh/bioinfo:base

ARG STAR_VERSION="2.7.1a"
RUN cd /opt; \
    wget https://github.com/alexdobin/STAR/archive/${STAR_VERSION}.tar.gz; \
    tar -xzf ${STAR_VERSION}.tar.gz; \
    cd STAR-${STAR_VERSION}/source; \
    make STAR; \
    cp STAR /usr/local/bin; \
    cd ../..; \
    rm -rf STAR-${STAR_VERSION} ${STAR_VERSION}.tar.gz

RUN STAR --version

ARG SUBREAD_VERSION="1.6.4"
RUN cd /opt; \
    wget -O subread-${SUBREAD_VERSION}-Linux-x86_64.tar.gz https://sourceforge.net/projects/subread/files/subread-${SUBREAD_VERSION}/subread-${SUBREAD_VERSION}-Linux-x86_64.tar.gz/download; \
    tar -xzvf subread-${SUBREAD_VERSION}-Linux-x86_64.tar.gz; \
    rm subread-${SUBREAD_VERSION}-Linux-x86_64.tar.gz;
ENV PATH=/opt/subread-${SUBREAD_VERSION}-Linux-x86_64/bin:$PATH

RUN featureCounts -v

RUN R -e "BiocManager::install(\"DESeq2\")"
RUN R -e "library(DESeq2)"

RUN R -e "library(devtools); install_github(\"shengqh/WebGestaltR\")"
RUN R -e "library(WebGestaltR)"

RUN pip3 install biopython

RUN R -e "install.packages('RColorBrewer')"
RUN R -e "library('RColorBrewer')"

RUN R -e "install.packages('VennDiagram')"
RUN R -e "library('VennDiagram')"

RUN R -e "install.packages('colorRamps')"
RUN R -e "library('colorRamps')"

RUN R -e "install.packages('cowplot')"
RUN R -e "library('cowplot')"

RUN R -e "install.packages('grid')"
RUN R -e "library('grid')"

RUN R -e "install.packages('lattice')"
RUN R -e "library('lattice')"

RUN R -e "install.packages('plyr')"
RUN R -e "library('plyr')"

RUN R -e "install.packages('reshape')"
RUN R -e "library('reshape')"

RUN R -e "install.packages('scales')"
RUN R -e "library('scales')"

RUN R -e "BiocManager::install('preprocessCore')"
RUN R -e "library('preprocessCore')"

RUN R -e "BiocManager::install('edgeR')"
RUN R -e "library('edgeR')"

RUN R -e "BiocManager::install('DT')"
RUN R -e "library('DT')"

RUN R -e "BiocManager::install('kableExtra')"
RUN R -e "library('kableExtra')"

COPY gsea-3.0.jar /opt/
RUN java -cp /opt/gsea-3.0.jar xtools.gsea.GseaPreranked -help

