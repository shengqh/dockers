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

RUN mkdir /opt/annovar_20250302
ADD annovar_20250302 /opt/annovar_20250302
ENV PATH=/opt/annovar_20250302:$PATH

RUN cd /opt/annovar_20250302; \
  mkdir humandb; \
  annotate_variation.pl -downdb -buildver hg38 -webfrom annovar refGene humandb/
  
# annotate_variation.pl -downdb -buildver hg38 -webfrom annovar avsnp151 humandb/; \
# annotate_variation.pl -downdb -buildver hg38 -webfrom annovar cytoBand humandb/; \
# annotate_variation.pl -downdb -buildver hg38 -webfrom annovar exac03 humandb/; \
# annotate_variation.pl -downdb -buildver hg38 -webfrom annovar 1000g2015aug humandb/; \
# annotate_variation.pl -downdb -buildver hg38 -webfrom annovar gnomad41_genome humandb/; \
# annotate_variation.pl -downdb -buildver hg38 -webfrom annovar clinvar_20250721 humandb/; \
# annotate_variation.pl -downdb -buildver hg38 -webfrom annovar cosmic70 humandb/; 
# annotate_variation.pl -downdb -buildver hg38 -webfrom annovar dbnsfp41a humandb/; \