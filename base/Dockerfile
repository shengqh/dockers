FROM shengqh/bioinfo:java1.8.0_perl5.22.1_r3.6.1_python3.7.3_mono5.20.1.19

RUN pip3 install --upgrade pip

ARG FASTQC_VERSION="v0.11.9"
RUN cd /opt; \
    wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_${FASTQC_VERSION}.zip; \
    unzip fastqc_${FASTQC_VERSION}.zip; \
    rm fastqc_${FASTQC_VERSION}.zip; \
    chmod 755 FastQC/fastqc;
ENV PATH=/opt/FastQC:$PATH

RUN fastqc --version                                                                                                                                                                                                                                                                         

RUN pip3 install cutadapt

RUN cutadapt --version

RUN pip3 install multiqc

RUN multiqc --version

RUN cd /opt; \
    wget https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/current/sratoolkit.current-ubuntu64.tar.gz; \
    tar -xzvf sratoolkit.current-ubuntu64.tar.gz; \
    rm sratoolkit.current-ubuntu64.tar.gz; 
ENV PATH=/opt/sratoolkit.2.10.4-ubuntu64/bin:$PATH

RUN apt-get update
RUN apt-get install -y libgd-dev

RUN curl -L http://cpanmin.us | perl - Getopt::Long;
RUN curl -L http://cpanmin.us | perl - --force Bio::SeqIO;
RUN curl -L http://cpanmin.us | perl - Algorithm::Loops;
RUN curl -L http://cpanmin.us | perl - Hash::Merge;
RUN curl -L http://cpanmin.us | perl - String::Util;

ENV SAMTOOLS_VERSION="1.10"
RUN cd /opt; \
    wget https://github.com/samtools/samtools/releases/download/${SAMTOOLS_VERSION}/samtools-${SAMTOOLS_VERSION}.tar.bz2 ; \
    tar -jxvf samtools-${SAMTOOLS_VERSION}.tar.bz2 ; \
    cd samtools-${SAMTOOLS_VERSION} ; \
    ./configure ; \
    make ; \
    make install ; \
    cd .. ; \
    rm -rf samtools-${SAMTOOLS_VERSION}
RUN samtools --version

ENV BCFTOOLS_VERSION="1.10"
RUN cd /opt; \
    wget https://github.com/samtools/bcftools/releases/download/${BCFTOOLS_VERSION}/bcftools-${BCFTOOLS_VERSION}.tar.bz2 ; \
    tar -jxvf bcftools-${BCFTOOLS_VERSION}.tar.bz2 ; \
    cd bcftools-${BCFTOOLS_VERSION} ; \
    ./configure ; \
    make ; \
    make install ; \
    cd .. ; \
    rm -rf bcftools-${BCFTOOLS_VERSION}
RUN bcftools --version

RUN pip3 install pysam

RUN cd /opt; \
    wget ftp://ftp.ncbi.nlm.nih.gov/entrez/entrezdirect/edirect.tar.gz; \
    tar -xzvf edirect.tar.gz; \
    rm edirect.tar.gz; \
    ./edirect/setup.sh
ENV PATH=/opt/edirect:$PATH

ENV SAMBAMBA_VERSION="0.7.1"
RUN wget https://github.com/biod/sambamba/releases/download/v${SAMBAMBA_VERSION}/sambamba-${SAMBAMBA_VERSION}-linux-static.gz ; \
    gunzip sambamba-${SAMBAMBA_VERSION}-linux-static.gz ; \
    chmod 755 sambamba-${SAMBAMBA_VERSION}-linux-static ; \
    mv sambamba-${SAMBAMBA_VERSION}-linux-static /usr/bin/sambamba
RUN sambamba --version

ARG CQSTOOLS_VERSION="1.8.11"  
RUN cd /opt; \
    wget https://github.com/shengqh/CQS.Tools/releases/download/v${CQSTOOLS_VERSION}/cqstools.${CQSTOOLS_VERSION}.zip; \
    unzip cqstools.${CQSTOOLS_VERSION}.zip; \
    rm cqstools.${CQSTOOLS_VERSION}.zip; \
    chmod 755 cqstools.${CQSTOOLS_VERSION}/cqstools; 
ENV PATH=/opt/cqstools.${CQSTOOLS_VERSION}:$PATH
