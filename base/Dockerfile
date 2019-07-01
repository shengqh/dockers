FROM shengqh/bioinfo:java1.8.0_perl5.22.1_r3.6.0_python3.7.3_mono5.20.1.19

ARG FASTQC_VERSION="v0.11.8"
RUN cd /opt; \
    wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_${FASTQC_VERSION}.zip; \
    unzip fastqc_${FASTQC_VERSION}.zip; \
    rm fastqc_${FASTQC_VERSION}.zip; \
    chmod 755 FastQC/fastqc;
ENV PATH=$PATH:/opt/FastQC

RUN fastqc --version                                                                                                                                                                                                                                                                         

RUN pip3 install cutadapt

RUN cutadapt --version

RUN pip3 install multiqc

RUN multiqc --version

ARG CQSTOOLS_VERSION="1.8.1"  
RUN apt-get install -y unzip
RUN cd /opt; \
    wget https://github.com/shengqh/CQS.Tools/releases/download/v${CQSTOOLS_VERSION}/cqstools.${CQSTOOLS_VERSION}.zip; \
    unzip cqstools.${CQSTOOLS_VERSION}.zip; \
    rm cqstools.${CQSTOOLS_VERSION}.zip; \
    chmod 755 cqstools.${CQSTOOLS_VERSION}/cqstools; 
ENV PATH=$PATH:/opt/cqstools.${CQSTOOLS_VERSION}

RUN cqstools -h

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
