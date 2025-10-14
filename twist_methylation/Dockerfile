FROM shengqh/debian12bookworm_r4.5.1_python3.13.7_java17.0.16_mono6.12.0.200:20250905

RUN apt update && apt install -y apt-utils && apt upgrade -y

# Install dependencies
RUN apt install -y wget curl git build-essential zlib1g-dev libbz2-dev liblzma-dev libncurses5-dev

# Install cutadapt
RUN pip install cutadapt && cutadapt --version

# Install FastQC 0.11.9
RUN wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.9.zip && \
  unzip fastqc_v0.11.9.zip && \
  rm -f fastqc_v0.11.9.zip && \
  chmod +x FastQC/fastqc && \
  mv FastQC /opt/ && \
  ln -s /opt/FastQC/fastqc /usr/local/bin/fastqc && \
  fastqc --version

# Install GATK 4.6.2.0
RUN wget https://github.com/broadinstitute/gatk/releases/download/4.6.2.0/gatk-4.6.2.0.zip && \
  unzip gatk-4.6.2.0.zip && \
  rm -f gatk-4.6.2.0.zip && \
  mv gatk-4.6.2.0 /opt/gatk && \
  ln -s /opt/gatk/gatk /usr/local/bin/gatk && \
  gatk --version

# Install MultiQC 1.31
RUN pip install multiqc==1.31 && \
  multiqc --version

# Install Picard 3.4.0
RUN wget https://github.com/broadinstitute/picard/releases/download/3.4.0/picard.jar && \
  mkdir -p /opt/picard && \
  mv picard.jar /opt/picard/ && \
  echo '#!/bin/bash\njava -jar /opt/picard/picard.jar "$@"' > /usr/local/bin/picard && \
  chmod +x /usr/local/bin/picard

# Install sambamba 1.0.1
RUN wget https://github.com/biod/sambamba/releases/download/v1.0.1/sambamba-1.0.1-linux-amd64-static.gz && \
  gunzip sambamba-1.0.1-linux-amd64-static.gz && \
  chmod +x sambamba-1.0.1-linux-amd64-static && \
  mv sambamba-1.0.1-linux-amd64-static /usr/local/bin/sambamba

# Install samtools 1.22.1
RUN wget https://github.com/samtools/samtools/releases/download/1.22.1/samtools-1.22.1.tar.bz2 && \
  tar -xjf samtools-1.22.1.tar.bz2 && \
  rm -f samtools-1.22.1.tar.bz2 && \
  cd samtools-1.22.1 && \
  ./configure && \
  make && \
  make install && \
  cd .. && rm -rf samtools-1.22.1 && \
  samtools --version

# Install seqtk seqtk-1.5 (r133)
RUN git clone https://github.com/lh3/seqtk.git && \
  cd seqtk && \
  git checkout v1.5 && \
  make && \
  cp seqtk /usr/local/bin/ && \
  cd .. && rm -rf seqtk && \
  which seqtk

# Install TrimGalore 0.6.10
RUN wget https://github.com/FelixKrueger/TrimGalore/archive/refs/tags/0.6.10.zip && \
  unzip 0.6.10.zip && \
  rm -f 0.6.10.zip && \
  mv TrimGalore-0.6.10 /opt/trim_galore && \
  ln -s /opt/trim_galore/trim_galore /usr/local/bin/trim_galore && \
  trim_galore --version

# Install libBigWig (dependency for MethylDackel)
RUN wget https://github.com/dpryan79/libBigWig/archive/0.4.8.tar.gz && \
  tar -xzf 0.4.8.tar.gz && \
  rm -f 0.4.8.tar.gz && \
  cd libBigWig-0.4.8 && \
  make install && \
  cd .. && rm -rf libBigWig-0.4.8

# Install hslib 1.22.1 (dependency for MethylDackel)
RUN wget https://github.com/samtools/htslib/releases/download/1.22.1/htslib-1.22.1.tar.bz2 && \
  tar -xjf htslib-1.22.1.tar.bz2 && \
  rm -f htslib-1.22.1.tar.bz2 && \
  cd htslib-1.22.1 && \
  ./configure && \
  make && \
  make install && \
  ldconfig && \
  cd .. && rm -rf htslib-1.22.1

# Install MethylDackel 
RUN git clone https://github.com/dpryan79/MethylDackel.git && \
  cd MethylDackel && \
  make LIBBIGWIG="/usr/local/lib/libBigWig.a" && \
  make install && \
  cd .. && rm -rf MethylDackel && \
  MethylDackel --version

RUN pip install toolshed setuptools

RUN wget https://github.com/brentp/bwa-meth/archive/master.zip && \
  unzip master.zip && \
  rm -rf master.zip && \
  cd bwa-meth-master/ && \
  python setup.py install && \
  cd .. && rm -rf bwa-meth-master/ && \
  bwameth.py --version
