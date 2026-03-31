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

RUN mkdir /opt/annovar_20250302
ADD annovar_20250302 /opt/annovar_20250302
ENV PATH=/opt/annovar_20250302:$PATH

RUN cd /opt/annovar_20250302; \
  mkdir humandb; \
  annotate_variation.pl -downdb -buildver hg38 -webfrom annovar refGene humandb/

RUN git clone https://github.com/shengqh/InterVar.git /opt/InterVar
#mim2gene.txt has been included in modified InterVar repo
#RUN cd /opt/InterVar/intervardb/ && wget https://www.omim.org/static/omim/data/mim2gene.txt
