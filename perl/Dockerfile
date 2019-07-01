FROM ubuntu:16.04

RUN mkdir /scratch /data 

RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y locales

RUN echo "LC_ALL=en_US.UTF-8" >> /etc/environment
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
RUN echo "LANG=en_US.UTF-8" > /etc/locale.conf
RUN locale-gen en_US.UTF-8

RUN apt-get install -y apt-transport-https ca-certificates libxml2-dev libcurl4-openssl-dev wget git pandoc
RUN wget --version && git --version

RUN apt-get install -y perl
RUN apt-get install -y libterm-readline-gnu-perl
RUN perl --version

RUN apt-get install -y curl libcurl3-dev libssl-dev
RUN curl --version

RUN apt-get install -y build-essential
RUN make --version

RUN curl -L http://cpanmin.us | perl - Perl::Core;
