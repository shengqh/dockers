FROM shengqh/bioinfo:r3.6.0

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
        rsync \
        unzip \
        zip \
        zlib1g-dev

RUN apt-get install -y python-pip
RUN apt-get clean

RUN pip install --no-cache-dir --upgrade pip
RUN cp /usr/local/bin/pip* /usr/bin

RUN pip install --no-cache-dir --upgrade \
        future \
        matplotlib \
        numpy \
        scipy \
        pandas \
        pytest

RUN R -e "install.packages(c(\"optparse\", \"rmarkdown\", \"knitr\", \"pscl\", \"gridExtra\"))"
RUN R -e "if (!requireNamespace(\"BiocManager\", quietly = TRUE)) install.packages(\"BiocManager\")"
RUN R -e "BiocManager::install(\"GenomicRanges\")"

