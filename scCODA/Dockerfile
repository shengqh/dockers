FROM python:3.9.18

RUN apt-get update
RUN apt-get install -y wget git
RUN apt-get install -y lbzip2
RUN apt-get install -y bzip2
RUN apt-get install -y autoconf
RUN apt-get install -y build-essential
RUN apt-get install -y libz-dev
RUN apt-get install -y libbz2-dev
RUN apt-get install -y liblzma-dev
RUN apt-get install -y libcurl4-openssl-dev
RUN apt-get install -y mlocate
RUN updatedb

RUN cd /opt; \
    git clone https://github.com/theislab/scCODA; \
    cd scCODA; \
    pip install -r requirements.txt; \
    python setup.py install; \
    cd ..; \
    rm -rf scCODA; \
    scCODA --version