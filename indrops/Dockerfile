FROM shengqh/bioinfo:java1.8.0_perl5.22.1_r3.6.1_python2.7.12

RUN pip install --upgrade pip
RUN pip install bowtie

RUN cd /opt; \
    git clone https://github.com/deweylab/RSEM.git; \
    cd RSEM; \
    make
ENV PATH=/opt/RSEM:$PATH

RUN apt-get install -y perl-doc

RUN cd /opt; \
    wget https://github.com/samtools/samtools/releases/download/1.3.1/samtools-1.3.1.tar.bz2; \
    tar xvfj samtools-1.3.1.tar.bz2; \
    cd samtools-1.3.1; \
    make; \
    make install; \
    cd ..; \
    rm -rf samtools-1.3.1
RUN samtools --version

RUN pip install numpy scipy pandas pyyaml matplotlib pyfasta
RUN pip install pysam

RUN cd /opt; \
    git clone https://github.com/indrops/indrops.git
RUN python /opt/indrops/indrops.py -h

ARG BOWTIE_VERSION="1.2.3"
RUN cd /opt; \
    wget https://github.com/BenLangmead/bowtie/releases/download/v${BOWTIE_VERSION}/bowtie-${BOWTIE_VERSION}-linux-x86_64.zip; \
    unzip bowtie-${BOWTIE_VERSION}-linux-x86_64.zip; \
    rm bowtie-${BOWTIE_VERSION}-linux-x86_64.zip
ENV PATH=$PATH:/opt/bowtie-${BOWTIE_VERSION}-linux-x86_64
RUN bowtie --version
