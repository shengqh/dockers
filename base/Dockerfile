FROM shengqh/debian12bookworm_r4.5.1_python3.13.9_java17.0.16_mono6.12.0.200:20251016

RUN apt-get update && \
  apt-get install -y libgd-dev libzstd-dev tabix

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"
RUN rustc --version

ARG SAMTOOLS_VERSION="1.22.1"
RUN cd /opt; \
    wget https://github.com/samtools/samtools/releases/download/${SAMTOOLS_VERSION}/samtools-${SAMTOOLS_VERSION}.tar.bz2 ; \
    tar -jxvf samtools-${SAMTOOLS_VERSION}.tar.bz2 ; \
    cd samtools-${SAMTOOLS_VERSION} ; \
    ./configure ; \
    make ; \
    make install ; \
    cd .. ; \
    rm -rf samtools-${SAMTOOLS_VERSION}; \
    samtools --version

ARG BCFTOOLS_VERSION="1.22"
RUN cd /opt; \
    wget https://github.com/samtools/bcftools/releases/download/${BCFTOOLS_VERSION}/bcftools-${BCFTOOLS_VERSION}.tar.bz2 ; \
    tar -jxvf bcftools-${BCFTOOLS_VERSION}.tar.bz2 ; \
    cd bcftools-${BCFTOOLS_VERSION} ; \
    ./configure ; \
    make ; \
    make install ; \
    cd .. ; \
    rm -rf bcftools-${BCFTOOLS_VERSION}; \
    bcftools --version

ARG PIGZ_VERSION="2.8"
RUN cd /opt; \
    wget https://zlib.net/pigz/pigz-${PIGZ_VERSION}.tar.gz ; \
    tar -xzvf pigz-${PIGZ_VERSION}.tar.gz; \
    rm pigz-${PIGZ_VERSION}.tar.gz; \
    cd pigz-${PIGZ_VERSION}; \
    make; \
    mv pigz unpigz /usr/bin; \
    cd ..; \
    rm -rf pigz-${PIGZ_VERSION}; \
    pigz -h

ARG FASTQC_VERSION="v0.12.1"
RUN cd /opt; \
    wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_${FASTQC_VERSION}.zip; \
    unzip fastqc_${FASTQC_VERSION}.zip; \
    rm fastqc_${FASTQC_VERSION}.zip; \
    chmod 755 FastQC/fastqc; \
    sed -i 's/250/5000/g' /opt/FastQC/fastqc

ARG CQSTOOLS_VERSION="1.8.14"
RUN cd /opt; \
    wget https://github.com/shengqh/CQS.Tools/releases/download/v${CQSTOOLS_VERSION}/cqstools.${CQSTOOLS_VERSION}.zip; \
    unzip cqstools.${CQSTOOLS_VERSION}.zip; \
    rm cqstools.${CQSTOOLS_VERSION}.zip; \
    chmod 755 cqstools.${CQSTOOLS_VERSION}/cqstools

ARG SAMBAMBA_VERSION="1.0.1"
RUN cd /opt; \
    wget https://github.com/biod/sambamba/releases/download/v${SAMBAMBA_VERSION}/sambamba-${SAMBAMBA_VERSION}-linux-amd64-static.gz; \
    gunzip sambamba-${SAMBAMBA_VERSION}-linux-amd64-static.gz; \
    chmod 755 sambamba-${SAMBAMBA_VERSION}-linux-amd64-static; \
    mv sambamba-${SAMBAMBA_VERSION}-linux-amd64-static /usr/bin/sambamba; \
    sambamba --version

RUN cd /opt; \
    wget ftp://ftp.ncbi.nlm.nih.gov/entrez/entrezdirect/edirect.tar.gz; \
    tar -xzvf edirect.tar.gz; \
    rm edirect.tar.gz

ARG sratoolkit_VERSION="3.2.1"
RUN cd /opt; \
    wget https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/${sratoolkit_VERSION}/sratoolkit.${sratoolkit_VERSION}-ubuntu64.tar.gz; \
    tar -xzvf sratoolkit.${sratoolkit_VERSION}-ubuntu64.tar.gz; \
    rm sratoolkit.${sratoolkit_VERSION}-ubuntu64.tar.gz; 

ARG PANDOC_VERSION="3.7.0.2"
RUN cd /opt; \
    wget https://github.com/jgm/pandoc/releases/download/${PANDOC_VERSION}/pandoc-${PANDOC_VERSION}-linux-amd64.tar.gz; \
    tar -xzvf pandoc-${PANDOC_VERSION}-linux-amd64.tar.gz; \
    rm pandoc-${PANDOC_VERSION}-linux-amd64.tar.gz

ARG GSEA_VERSION="4.4.0"
RUN cd /opt; \
    wget https://data.broadinstitute.org/gsea-msigdb/gsea/software/desktop/4.4/GSEA_LinuxIntel_${GSEA_VERSION}-WithJava.zip ; \
    unzip GSEA_LinuxIntel_${GSEA_VERSION}-WithJava.zip ; \
    rm GSEA_LinuxIntel_${GSEA_VERSION}-WithJava.zip ;

ENV PATH=/opt/GSEA_Linux_${GSEA_VERSION}:/opt/cqstools.${CQSTOOLS_VERSION}:/opt/FastQC:/opt/edirect:/opt/pandoc-${PANDOC_VERSION}/bin:/opt/sratoolkit.${sratoolkit_VERSION}-ubuntu64/bin:$PATH
RUN fastqc --version && cqstools -h && pandoc --version && esearch -h                                                                                                                                                                                                                                                          

RUN R -e "install.packages('remotes'); library('remotes')" && \
    R -e 'install.packages("devtools");library(devtools)' && \
    R -e "BiocManager::install('ggplot2'); library('ggplot2')"  && \
    R -e "BiocManager::install('VennDiagram'); library('VennDiagram')" && \
    R -e "BiocManager::install('DT'); library('DT')" && \
    R -e "BiocManager::install('cowplot'); library('cowplot')" && \
    R -e "BiocManager::install('ggpubr'); library('ggpubr')" && \
    R -e "BiocManager::install('colorRamps'); library('colorRamps')" && \
    R -e "BiocManager::install('heatmap3'); library('heatmap3')" && \
    R -e "BiocManager::install('proj4'); library('proj4')" && \
    R -e "BiocManager::install('Cairo'); library('Cairo')" && \
    R -e "BiocManager::install('hrbrmstr/ggalt'); library('ggalt')" && \
    R -e "BiocManager::install('ggrastr'); library('ggrastr')" && \
    R -e "BiocManager::install('EnhancedVolcano'); library('EnhancedVolcano')" && \
    R -e "BiocManager::install('yihui/knitr'); library('knitr')" && \
    R -e "BiocManager::install('kableExtra'); library('kableExtra')" && \
    R -e "BiocManager::install('rmdformats'); library('rmdformats')" && \
    R -e "BiocManager::install('patchwork'); library('patchwork')"  && \
    R -e "BiocManager::install('cran/XML'); library('XML')" && \
    R -e "BiocManager::install('pkgdown'); library('pkgdown')" && \
    R -e "BiocManager::install('stringr', ask=F); library('stringr')" && \
    R -e "BiocManager::install('rlist', ask=F); library('rlist')" && \
    R -e "BiocManager::install('reshape2', ask=F); library('reshape2')" && \
    R -e "BiocManager::install('tidyverse', ask=F); library('tidyverse')" && \
    R -e "BiocManager::install('ComplexHeatmap', ask=F); library('ComplexHeatmap')" && \
    R -e "BiocManager::install('DESeq2', ask=F); library('DESeq2')" && \
    R -e "BiocManager::install('edgeR', ask=F); library('edgeR')" && \
    R -e "BiocManager::install('xlsx');library('xlsx')" && \
    R -e "BiocManager::install('shiny');library('shiny')" && \
    R -e "BiocManager::install('ggExtra');library('ggExtra')" && \
    R -e "BiocManager::install('hdf5r');library(hdf5r)" && \
    R -e "install.packages('RCurl');library('RCurl')" && \
    R -e "install.packages('car');library('car')" && \
    R -e "BiocManager::install('limma');library('limma')" && \
    R -e "BiocManager::install('ggdendro');library('ggdendro')" && \
    R -e "BiocManager::install('formatR');library('formatR')" && \
    R -e "BiocManager::install('tictoc', ask=FALSE);library('tictoc')" && \
    R -e "BiocManager::install('testit');library('testit')" && \
    R -e "BiocManager::install('clustree');library('clustree')" && \
    R -e "BiocManager::install('mclust');library('mclust')" && \
    R -e "BiocManager::install('bzhanglab/WebGestaltR', ask=FALSE);library('WebGestaltR')" && \
    R -e "BiocManager::install('qqconf', ask=FALSE);library('qqconf')" && \
    R -e "BiocManager::install('cvarrichio/Matrix.utils', force=TRUE, ask=FALSE);library('Matrix.utils')" && \
    R -e "BiocManager::install('kevinblighe/EnhancedVolcano', ask=FALSE);library('EnhancedVolcano')" && \
    R -e "BiocManager::install('rmdformats', ask=FALSE);library('rmdformats')" && \
    R -e "BiocManager::install('formatR', ask=FALSE);library('formatR')" && \
    R -e "BiocManager::install('rjson', ask=FALSE);library('rjson')"


RUN pip install --no-cache-dir --upgrade \
  setuptools

#numba don't support python 3.14 yet
RUN git clone https://github.com/numba/numba.git && \
    cd numba && \
    python setup.py install && \
    cd .. && rm -rf numba

RUN pip install --no-cache-dir --upgrade \
  wheel \
  pyarrow \
  biopython \
  pytabix \
  cutadapt \
  multiqc

RUN pip install --no-cache-dir --upgrade \
  pysam

ARG NGSPERL_VERSION="20250905"
RUN cd /opt/ngsperl/ && git pull
