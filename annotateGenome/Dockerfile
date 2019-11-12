FROM shengqh/bioinfo:java1.8.0_perl5.22.1_r3.6.1_python3.7.3

ARG PANDOC_VERSION="2.7.3"
RUN cd /opt; \
    wget https://github.com/jgm/pandoc/releases/download/${PANDOC_VERSION}/pandoc-${PANDOC_VERSION}-linux.tar.gz; \
    tar -xzvf pandoc-${PANDOC_VERSION}-linux.tar.gz; \
    rm pandoc-${PANDOC_VERSION}-linux.tar.gz
ENV PATH=/opt/pandoc-${PANDOC_VERSION}/bin:$PATH

RUN pandoc --version

RUN pip install git+git://github.com/shengqh/annotateGenome.git

RUN annotateGenome -h
