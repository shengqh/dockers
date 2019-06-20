FROM ubuntu:16.04

RUN mkdir /scratch /data 

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
