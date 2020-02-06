FROM shengqh/bioinfo:java1.8.0_perl5.22.1_r3.6.1

RUN apt-get update

RUN apt-get install -y --no-install-recommends \
        build-essential \
        curl \
        git \
        libcurl3-dev \
        libfreetype6-dev \
        pkg-config \
        python \
        python-dev \
        python-pip \
        rsync \
        unzip \
        zip \
        zlib1g-dev

RUN pip2 install --no-cache-dir --upgrade pip
RUN cp /usr/local/bin/pip* /usr/bin

RUN pip2 install --no-cache-dir --upgrade \
        future \
        matplotlib \
        numpy \
        scipy \
        pandas \
        pytest


