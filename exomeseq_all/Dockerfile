FROM broadinstitute/gatk

RUN mkdir /scratch /data

RUN apt-get update
RUN apt-get install -y apt-utils locales

RUN echo "LC_ALL=en_US.UTF-8" >> /etc/environment
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
RUN echo "LANG=en_US.UTF-8" > /etc/locale.conf
RUN locale-gen en_US.UTF-8

RUN apt-get install -y apt-transport-https ca-certificates libxml2-dev libcurl4-openssl-dev wget git pandoc

RUN apt-get remove r-base
RUN apt-get clean; apt-get autoclean

RUN echo "deb https://cloud.r-project.org/bin/linux/ubuntu xenial-cran35/ " >> /etc/apt/sources.list
RUN more /etc/apt/sources.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9

RUN apt-get update
RUN apt-get upgrade -y

RUN R -e "install.packages('BiocManager',repos='http://cran.us.r-project.org')"
RUN R -e "BiocManager::install(update=T,ask=F)"

ENV BWA_VERSION="0.7.17"
RUN wget -O bwa-${BWA_VERSION}.tar.bz2 https://sourceforge.net/projects/bio-bwa/files/bwa-${BWA_VERSION}.tar.bz2/download; \
    tar -jxvf bwa-${BWA_VERSION}.tar.bz2 ; \
    cd bwa-${BWA_VERSION}; \
    make; \
    cp bwa /usr/bin ; \
    cd .. ; \
    rm -rf bwa-${BWA_VERSION}

ENV SAMTOOLS_VERSION="1.9"
RUN wget https://github.com/samtools/samtools/releases/download/${SAMTOOLS_VERSION}/samtools-${SAMTOOLS_VERSION}.tar.bz2 ; \
    tar -jxvf samtools-${SAMTOOLS_VERSION}.tar.bz2 ; \
    cd samtools-${SAMTOOLS_VERSION} ; \
    ./configure ; \
    make ; \
    make install ; \
    cd .. ; \
    rm -rf samtools-${SAMTOOLS_VERSION}
RUN samtools --version

RUN mkdir /opt/annovar
ADD annovar /opt/annovar
ENV PATH=$PATH:/opt/annovar

RUN mkdir /opt/gatk
COPY gatk3.jar picard.jar /opt/gatk/

RUN apt-get install -y libssl-dev
RUN R -e "BiocManager::install('biomaRt')"
RUN R -e "library('biomaRt')"

ARG FASTQC_VERSION="v0.11.8"
RUN cd /opt; \
    wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_${FASTQC_VERSION}.zip; \
    unzip fastqc_${FASTQC_VERSION}.zip; \
    rm fastqc_${FASTQC_VERSION}.zip; \
    chmod 755 FastQC/fastqc;
ENV PATH=$PATH:/opt/FastQC
RUN fastqc --version   

RUN pip install --upgrade pip

RUN cd /opt; \
    wget https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/current/sratoolkit.current-ubuntu64.tar.gz; \
    tar -xzvf sratoolkit.current-ubuntu64.tar.gz; \
    rm sratoolkit.current-ubuntu64.tar.gz; 
ENV PATH=$PATH:/opt/sratoolkit.2.9.6-1-ubuntu64/bin

RUN apt-get install -y libgd-dev

RUN curl -L http://cpanmin.us | perl - Getopt::Long;
RUN curl -L http://cpanmin.us | perl - Bio::SeqIO;
RUN curl -L http://cpanmin.us | perl - Algorithm::Loops;
RUN curl -L http://cpanmin.us | perl - Hash::Merge;
RUN curl -L http://cpanmin.us | perl - String::Util;

RUN pip uninstall -y enum34; \
    pip install cutadapt; \
    cutadapt --version

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

RUN pip install enum34; \
    pip install multiqc; \
    multiqc --version

RUN R -e "BiocManager::install(c('ComplexHeatmap', 'dplyr', 'maftools', 'devtools'))"
RUN R -e "BiocManager::install(c('GenomeInfoDb', 'GenomicRanges'))"
RUN R -e "library('devtools'); install_github('slzhao/mafreport')"


