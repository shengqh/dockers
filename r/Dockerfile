FROM ubuntu:16.04

RUN mkdir /scratch /data 

ARG R_VERSION
ARG BUILD_DATE
ENV BUILD_DATE ${BUILD_DATE:-2019-06-20}
ENV R_VERSION=${R_VERSION:-3.6.0} \
    LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    TERM=linux

RUN apt-get update
RUN apt-get install -y apt-transport-https ca-certificates

RUN echo "deb https://cloud.r-project.org/bin/linux/ubuntu xenial-cran35/ " >> /etc/apt/sources.list
RUN more /etc/apt/sources.list

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
RUN apt-get update
RUN apt-get install -y apt-transport-https
RUN apt-get install -y r-base
RUN apt-get install -y r-base-dev

CMD ["R"]
