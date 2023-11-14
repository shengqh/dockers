FROM ubuntu:18.04

# set up all essential environment variables
ENV LC_ALL=C
ENV PATH=/miniconda3/bin:/opt/minimap2-2.26_x64-linux:/opt/bedtools-2:/opt/freebayes/build:/opt/hisat2-2.2.1:/opt/bedtools2/bin:/opt/souporcell:/opt/souporcell/troublet/target/release:/usr/local/condabin:/opt/minimap2-2.26_x64-linux:/root/.cargo/bin:/opt:$PATH
ENV PYTHONPATH=/miniconda3/lib/python3.9/:$PYTHONPATH
    
# update and install essential dependencies
RUN apt-get -y update && \
    apt-get install -y automake build-essential bzip2 wget git default-jre unzip curl
    
# download, install, and update miniconda3
RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    bash Miniconda3-latest-Linux-x86_64.sh -b -f -p /miniconda3/ && \
    rm Miniconda3-latest-Linux-x86_64.sh
    
# install dependencies via conda
ENV PATH="/miniconda3/bin:$PATH"
RUN conda install -y -c conda-forge pip numpy # general dependencies && \
    conda update --all
    
RUN apt-get -y install libncurses5-dev zlib1g-dev libbz2-dev liblzma-dev zip unzip pkg-config

#RUN curl https://sh.rustup.rs -sSf | bash -s -- -y && cargo --version

RUN cd /opt && \
    wget https://cloud.biohpc.swmed.edu/index.php/s/oTtGWbWjaxsQ2Ho/download && \
    mv download hisat2.zip && \
    unzip hisat2.zip && rm hisat2.zip && \
    wget https://github.com/lh3/minimap2/releases/download/v2.26/minimap2-2.26_x64-linux.tar.bz2 && \
    tar -xf minimap2-2.26_x64-linux.tar.bz2 && rm minimap2-2.26_x64-linux.tar.bz2 && \
    wget https://github.com/arq5x/bedtools2/releases/download/v2.28.0/bedtools-2.28.0.tar.gz && \
    tar -xf bedtools-2.28.0.tar.gz && rm bedtools-2.28.0.tar.gz && \
    cd bedtools2 && \
    make

ENV CARGO_HOME=/opt/.cargo
ENV RUSTUP_HOME=/opt/.cargo
ENV PATH=/opt/.cargo/bin:$PATH

RUN cd /opt && \
    bash -c 'curl https://sh.rustup.rs -sSf | sh -s -- -y' && \
    rustup default stable

RUN cd /opt && \
    git clone --recursive https://github.com/wheaton5/souporcell.git && \
    cd souporcell/troublet && \
    cargo build --release && \
    cd /opt/souporcell/souporcell && \
    cargo build --release

RUN pip install pysam

RUN python -m pip install Cython NumPy

RUN pip install git+https://github.com/stan-dev/pystan2.git@master
RUN pip install pyfaidx
RUN pip install "setuptools<58" --upgrade
RUN pip install pyvcf
RUN pip install scipy

RUN cd /opt && \
    wget https://github.com/samtools/htslib/releases/download/1.9/htslib-1.9.tar.bz2 && \
    tar xvfj htslib-1.9.tar.bz2 && \
    cd htslib-1.9 && \
    ./configure && \
    make && \
    make install && \
    cd .. && \
    rm -rf htslib-1.9.tar.bz2 htslib-1.9 && \
    wget https://github.com/samtools/samtools/releases/download/1.9/samtools-1.9.tar.bz2 && \
    tar xvfj samtools-1.9.tar.bz2 && \
    cd samtools-1.9 && \
    ./configure && \
    make && \
    make install && \
    cd .. && \
    rm -rf samtools-1.9.tar.bz2 samtools-1.9 && \
    wget https://github.com/samtools/bcftools/releases/download/1.9/bcftools-1.9.tar.bz2 && \
    tar xvfj bcftools-1.9.tar.bz2 && \
    cd bcftools-1.9 && \
    ./configure && \
    make && \
    make install && \
    cd .. && \
    rm -rf bcftools-1.9 bcftools-1.9.tar.bz2

RUN cd /opt && \
    wget https://github.com/freebayes/freebayes/releases/download/v1.3.6/freebayes-1.3.6-linux-amd64-static.gz && \
    gunzip freebayes-1.3.6-linux-amd64-static.gz && \
    mv freebayes-1.3.6-linux-amd64-static freebayes && \
    chmod 777 freebayes 
RUN cd /opt && \
    wget https://github.com/10XGenomics/vartrix/releases/download/v1.1.22/vartrix_linux && \
    mv vartrix_linux vartrix && \
    chmod 777 vartrix
