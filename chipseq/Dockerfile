FROM shengqh/bioinfo:base

ENV BOWTIE2_VERSION="2.4.1"
ENV PATH=/opt/bowtie2-${BOWTIE2_VERSION}-linux-x86_64:$PATH
RUN cd /opt; \
    wget https://github.com/BenLangmead/bowtie2/releases/download/v${BOWTIE2_VERSION}/bowtie2-${BOWTIE2_VERSION}-linux-x86_64.zip; \
    unzip bowtie2-${BOWTIE2_VERSION}-linux-x86_64.zip ; \
    rm -rf bowtie2-${BOWTIE2_VERSION}-linux-x86_64.zip; bowtie2 --version

COPY picard.jar /opt/

RUN R -e "install.packages('XML', repos='http://www.omegahat.net/R'); library('XML')"
RUN R -e "BiocManager::install('biomaRt'); library('biomaRt')"
RUN R -e "BiocManager::install('stringr'); library('stringr')"

RUN apt-get update

RUN apt-get install -y --no-install-recommends \
        python \
        python-dev

RUN curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py; \
    python2 get-pip.py

RUN pip2 install --no-cache-dir --upgrade \
        future \
        matplotlib \
        numpy \
        scipy \
        pandas \
        pytest

#RUN sed -i 's/#!\/usr\/bin\/python/#!\/usr\/bin\/python2/' /usr/local/bin/pip2

RUN pip2 install macs; macs --version

RUN wget https://bootstrap.pypa.io/get-pip.py; python3 get-pip.py; pip3 --version
RUN pip3 install macs2; macs2 --version

RUN R -e "BiocManager::install(c('DT', 'VennDiagram'), ask=F);"
RUN R -e "BiocManager::install(c('DESeq2', 'edgeR'), ask=F);"
RUN R -e "BiocManager::install(c('cowplot'), ask=F);"
RUN R -e "BiocManager::install(c('ggpubr', 'rlist'), ask=F);"
RUN R -e "BiocManager::install(c('remotes'), ask=F);"
RUN R -e "BiocManager::install(c('devtools'), ask=F);"

RUN mkdir /opt/homer; \
    cd /opt/homer; \
    wget http://homer.ucsd.edu/homer/configureHomer.pl; \
    perl configureHomer.pl -install; 

#use a softlink so that data gets off of unwritable dirs and points to my annotation directory
RUN rm -rf /opt/homer/data && ln -s /scratch/cqs_share/softwares/homer2/data /opt/homer/data
#same with config file that tells where the data is
RUN rm -f /opt/homer/config.txt && ln -s /scratch/cqs_share/softwares/homer2/config.txt /opt/homer/config.txt

ENV PATH=/opt/homer/bin:$PATH

ENV BWA_VERSION="0.7.17"
RUN wget http://downloads.sourceforge.net/project/bio-bwa/bwa-${BWA_VERSION}.tar.bz2; \
    tar -jxvf bwa-${BWA_VERSION}.tar.bz2 ; \
    cd bwa-${BWA_VERSION}; \
    make; \
    cp bwa /usr/bin ; \
    cd .. ; \
    rm -rf bwa-${BWA_VERSION}

RUN R -e "BiocManager::install('TxDb.Hsapiens.UCSC.hg38.knownGene'); library('TxDb.Hsapiens.UCSC.hg38.knownGene')"
RUN R -e "BiocManager::install('kableExtra'); library('kableExtra')"

RUN apt-get install -y libv8-dev
RUN apt-get install -y librsvg2-dev

RUN R -e "BiocManager::install('tidyverse'); library('tidyverse')"

RUN apt-get install -y imagemagick
RUN apt-get install -y libgit2-dev

RUN R -e 'install.packages("devtools");library(devtools)'

RUN R -e 'library(devtools);install_github("shengqh/ChIPQC")'

RUN sed -i 's/250/5000/g' /opt/FastQC/fastqc

RUN R -e "BiocManager::install('DiffBind', ask=F); library('DiffBind')"

ENV ChIPQC_VERSION="v20210325"
RUN R -e 'library(devtools);install_github("shengqh/ChIPQC")'

RUN pip3 install pysam

RUN R -e "BiocManager::install('Homo.sapiens'); library('Homo.sapiens')"
RUN R -e "BiocManager::install('GenomicRanges'); library('GenomicRanges')"
RUN R -e "BiocManager::install('biovizBase'); library('biovizBase')"
RUN R -e "BiocManager::install('cowplot'); library('cowplot')"
RUN R -e "BiocManager::install('ggbio'); library('ggbio')"
RUN R -e "BiocManager::install('ChIPpeakAnno'); library('ChIPpeakAnno')"

#allow converting pdf to png
RUN sed -i '/disable ghostscript format types/,+6d' /etc/ImageMagick-6/policy.xml   
ADD bedGraphToBigWig /usr/bin/bedGraphToBigWig