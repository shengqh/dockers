FROM ubuntu:22.04

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

RUN apt-get update -y && apt-get install -y wget

RUN cd /usr/bin; wget http://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64/bigBedNamedItems; chmod 755 bigBedNamedItems
