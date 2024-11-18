FROM ubuntu:20.04

#Updating ubuntu and installing other necessary software
RUN apt-get clean all \
	&& apt-get -y update  \
	&& apt-get upgrade -y \
	&& apt-get install -y \
		unzip \
		wget \
		build-essential \
		zlib1g-dev \
		libncurses5-dev \
	&& apt-get clean

ENV annovar_ver=UNTIL_20241117
RUN mkdir /opt/annovar
ADD annovar /opt/annovar
ENV PATH=/opt/annovar:$PATH

RUN cd /opt/annovar; \
  mkdir humandb; \
  annotate_variation.pl -downdb -buildver hg38 -webfrom annovar refGene humandb/
