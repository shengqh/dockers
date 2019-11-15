FROM shengqh/bioinfo:base

ENV BOWTIE2_VERSION="2.3.5.1"
ENV PATH=/opt/bowtie2-${BOWTIE2_VERSION}-linux-x86_64:$PATH
RUN cd /opt; \
    wget https://github.com/BenLangmead/bowtie2/releases/download/v${BOWTIE2_VERSION}/bowtie2-${BOWTIE2_VERSION}-linux-x86_64.zip; \
    unzip bowtie2-${BOWTIE2_VERSION}-linux-x86_64.zip ; \
    rm -rf bowtie2-${BOWTIE2_VERSION}-linux-x86_64.zip; bowtie2 --version

COPY picard.jar /opt/

RUN R -e "BiocManager::install('biomaRt'); library('biomaRt')"
RUN R -e "BiocManager::install('stringr'); library('stringr')"

RUN apt-get update

RUN apt-get install -y --no-install-recommends \
        python \
        python-dev

RUN apt-get install -y python-pip
RUN apt-get clean
RUN pip2 install --upgrade pip
RUN sed -i 's/#!\/usr\/bin\/python/#!\/usr\/bin\/python2/' /usr/local/bin/pip2

RUN pip2 install --no-cache-dir --upgrade \
        future \
        matplotlib \
        numpy \
        scipy \
        pandas \
        pytest

RUN pip2 install macs2; macs2 --version
RUN pip2 install macs; macs --version

RUN rm /usr/bin/*3.5

RUN R -e "BiocManager::install('DT')"
RUN R -e "library('DT')"
RUN R -e "BiocManager::install('VennDiagram')"
RUN R -e "library('VennDiagram')"
RUN R -e "BiocManager::install('DESeq2')"
RUN R -e "library('DESeq2')"
RUN R -e "BiocManager::install('edgeR')"
RUN R -e "library('edgeR')"
RUN R -e "BiocManager::install('cowplot')"
RUN R -e "library('cowplot')"
RUN R -e "BiocManager::install('shengqh/ChIPQC')"
RUN R -e "BiocManager::install('ggpubr');"

RUN mkdir /opt/homer; \
    cd /opt/homer; \
    wget http://homer.ucsd.edu/homer/configureHomer.pl; \
    perl configureHomer.pl -install; 

#use a softlink so that data gets off of unwritable dirs and points to my annotation directory
RUN rm -rf /opt/homer/data
RUN ln -s /scratch/cqs/softwares/homer2/data /opt/homer/data
#same with config file that tells where the data is
RUN rm -f /opt/homer/config.txt && ln -s /scratch/cqs/softwares/homer2/config.txt /opt/homer/config.txt

ENV PATH=/opt/homer/bin:$PATH
