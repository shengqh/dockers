FROM python:3.12.13

RUN apt-get clean all \
	&& apt-get -y update  \
	&& apt-get upgrade -y \
	&& apt-get install -y \
		unzip \
		wget \
		build-essential \
		zlib1g-dev \
		libncurses5-dev \
    git \
	&& apt-get clean

RUN cd /opt && wget https://github.com/d3b-center/D3b-autoPVS1/archive/refs/tags/v2.0.0.tar.gz \
	&& tar -xzf v2.0.0.tar.gz \
	&& rm v2.0.0.tar.gz

RUN pip install --no-cache-dir pyfaidx pyhgvs argparse pysam

COPY config.ini /opt/D3b-autoPVS1-2.0.0/config.ini

	