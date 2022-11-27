FROM shengqh/bioinfo_base:20221127

ENV BOWTIE2_VERSION="2.4.1"
ENV PATH=/opt/bowtie2-${BOWTIE2_VERSION}-linux-x86_64:$PATH
RUN cd /opt; \
    wget https://github.com/BenLangmead/bowtie2/releases/download/v${BOWTIE2_VERSION}/bowtie2-${BOWTIE2_VERSION}-linux-x86_64.zip; \
    unzip bowtie2-${BOWTIE2_VERSION}-linux-x86_64.zip ; \
    rm -rf bowtie2-${BOWTIE2_VERSION}-linux-x86_64.zip; bowtie2 --version

COPY picard.jar /opt/

RUN apt-get update && \
    apt-get install -y --no-install-recommends python python-dev && \
    python2 --version

RUN curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-python2-pip.py; \
    python2 get-python2-pip.py

RUN pip2 install --no-cache-dir --upgrade \
        future \
        matplotlib \
        numpy \
        scipy \
        pandas \
        pytest

#RUN sed -i 's/#!\/usr\/bin\/python/#!\/usr\/bin\/python2/' /usr/local/bin/pip2

RUN pip2 install macs; macs --version

RUN curl https://bootstrap.pypa.io/get-pip.py --output get-python3-pip.py; \
    python3 get-python3-pip.py; pip3 --version
RUN pip3 install macs2; macs2 --version

RUN apt-get install -y libharfbuzz-dev libfribidi-dev libv8-dev librsvg2-dev imagemagick libgit2-dev

RUN R -e "BiocManager::install('biomaRt'); library('biomaRt')"
RUN R -e "BiocManager::install('TxDb.Hsapiens.UCSC.hg38.knownGene'); library('TxDb.Hsapiens.UCSC.hg38.knownGene')"

RUN R -e "BiocManager::install('cran/locfit', ask=F); library('locfit')"
RUN R -e "BiocManager::install('DiffBind', ask=F); library('DiffBind')"
RUN R -e "BiocManager::install('Homo.sapiens'); library('Homo.sapiens')"
RUN R -e "BiocManager::install('GenomicRanges'); library('GenomicRanges')"
RUN R -e "BiocManager::install('biovizBase'); library('biovizBase')"
RUN R -e "BiocManager::install('ggbio'); library('ggbio')"
RUN R -e "BiocManager::install('ChIPpeakAnno'); library('ChIPpeakAnno')"

ENV ChIPQC_VERSION="v20221126"
RUN R -e 'library(devtools);install_github("shengqh/ChIPQC");library(ChIPQC)'

#allow converting pdf to png
RUN sed -i '/disable ghostscript format types/,+6d' /etc/ImageMagick-6/policy.xml   
ADD bedGraphToBigWig /usr/bin/bedGraphToBigWig

RUN mkdir /opt/homer; \
    cd /opt/homer; \
    wget http://homer.ucsd.edu/homer/configureHomer.pl; \
    perl configureHomer.pl -install; 

#use a softlink so that data gets off of unwritable dirs and points to my annotation directory
RUN rm -rf /opt/homer/data && ln -s /data/cqs/softwares/homer/data /opt/homer/data
#same with config file that tells where the data is
RUN rm -f /opt/homer/config.txt && ln -s /data/cqs/softwares/homer/config.txt /opt/homer/config.txt

ENV PATH=/opt/homer/bin:$PATH

ENV BWA_VERSION="0.7.17"
RUN wget http://downloads.sourceforge.net/project/bio-bwa/bwa-${BWA_VERSION}.tar.bz2; \
    tar -jxvf bwa-${BWA_VERSION}.tar.bz2 ; \
    cd bwa-${BWA_VERSION}; \
    make; \
    cp bwa /usr/bin ; \
    cd .. ; \
    rm -rf bwa-${BWA_VERSION}
