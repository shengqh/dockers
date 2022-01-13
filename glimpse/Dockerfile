FROM ubuntu:22.04

RUN apt-get update
RUN apt-get install -y wget
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

RUN cd /usr/bin; \
    wget https://github.com/odelaneau/GLIMPSE/releases/download/v1.1.1/GLIMPSE_chunk_static; mv GLIMPSE_chunk_static GLIMPSE_chunk; \
    wget https://github.com/odelaneau/GLIMPSE/releases/download/v1.1.1/GLIMPSE_concordance_static; mv GLIMPSE_concordance_static GLIMPSE_concordance; \
    wget https://github.com/odelaneau/GLIMPSE/releases/download/v1.1.1/GLIMPSE_ligate_static; mv GLIMPSE_ligate_static GLIMPSE_ligate; \
    wget https://github.com/odelaneau/GLIMPSE/releases/download/v1.1.1/GLIMPSE_phase_static; mv GLIMPSE_phase_static GLIMPSE_phase; \
    wget https://github.com/odelaneau/GLIMPSE/releases/download/v1.1.1/GLIMPSE_sample_static; mv GLIMPSE_sample_static GLIMPSE_sample; \
    wget https://github.com/odelaneau/GLIMPSE/releases/download/v1.1.1/GLIMPSE_snparray_static; mv GLIMPSE_snparray_static GLIMPSE_snparray; \
    wget https://github.com/odelaneau/GLIMPSE/releases/download/v1.1.1/GLIMPSE_stats_static; mv GLIMPSE_stats_static GLIMPSE_stats; \
    chmod 755 GLIMPSE*

RUN apt-get install -y bcftools
RUN apt-get install -y tabix
