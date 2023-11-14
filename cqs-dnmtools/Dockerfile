

# Build htslib from source
FROM alpine:latest
RUN apk update 
WORKDIR /app

RUN apk add build-base 
RUN apk add autoconf 
RUN apk add automake 
RUN apk add gsl-dev zlib-dev bzip2-dev xz-dev ncurses-dev libstdc++ libgomp
RUN apk add wget git

ENV HTS=1.18
ENV HTSDIR=htslib-${HTS}

RUN mkdir /app/htslib &&  cd /app/htslib \
  && wget https://github.com/samtools/htslib/releases/download/${HTS}/${HTSDIR}.tar.bz2 \
  && tar -xf ${HTSDIR}.tar.bz2 \
  && cd /app/htslib/${HTSDIR} \
  &&  autoreconf -i &&  ./configure && make && make install 

ENV SAM=1.18
ENV SAMDIR=samtools-${SAM}

RUN mkdir /app/samtools &&  cd /app/samtools \
  && wget https://github.com/samtools/samtools/releases/download/${SAM}/${SAMDIR}.tar.bz2 \
  && tar -xf ${SAMDIR}.tar.bz2 \
  && cd /app/samtools/${SAMDIR} \
  &&  ./configure && make && make install 

ENV DNM=1.4.2
ENV DNMDIR=dnmtools-${DNM}

RUN mkdir /app/dnmtools && cd /app/dnmtools \
  && wget https://github.com/smithlabcode/dnmtools/releases/download/v${DNM}/${DNMDIR}.tar.gz \
  && tar -xzvf ${DNMDIR}.tar.gz \
  && cd /app/dnmtools/${DNMDIR} \
  && mkdir build && cd build \
  && ../configure && make && make install

# Don't use the 3.2.0.tar.gz file from github. Although it is also called v3.2.0
# it actually lack -B (-bam) parameter in preseq c_curve.
RUN cd /opt \
  && git clone https://github.com/smithlabcode/preseq.git --recursive \
  && cd preseq/src \
  && make HAVE_HTSLIB=1 all && make install

RUN rm -rf /app/htslib /app/samtools /app/dnmtools /app/preseq

COPY picard.jar /opt

RUN apk add openjdk11
RUN apk add krb5-dev gcompat

COPY wigToBigWig /usr/bin
COPY bedToBigBed /usr/bin

RUN apk add R
