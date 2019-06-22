FROM shengqh/bioinfo:r_python_mono_jre

ARG FASTQC_VERSION="v0.11.8"
RUN cd /opt; \
    wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_${FASTQC_VERSION}.zip; \
    unzip fastqc_${FASTQC_VERSION}.zip; \
    rm fastqc_${FASTQC_VERSION}.zip; \
    chmod 755 FastQC/fastqc;
ENV PATH=$PATH:/opt/FastQC

RUN fastqc --version                                                                                                                                                                                                                                                                         
RUN pip install cutadapt

RUN cutadapt --version

RUN apt-get install -y rna-star

RUN STAR --version

RUN pip install multiqc

RUN multiqc --version

RUN apt-get install -y subread

RUN featureCounts -v

ARG CQSTOOLS_VERSION="1.8.1"  
RUN apt-get install -y unzip
RUN cd /opt; \
    wget https://github.com/shengqh/CQS.Tools/releases/download/v${CQSTOOLS_VERSION}/cqstools.${CQSTOOLS_VERSION}.zip; \
    unzip cqstools.${CQSTOOLS_VERSION}.zip; \
    rm cqstools.${CQSTOOLS_VERSION}.zip; \
    chmod 755 cqstools.${CQSTOOLS_VERSION}/cqstools; 
ENV PATH=$PATH:/opt/cqstools.${CQSTOOLS_VERSION}

RUN cqstools -h
