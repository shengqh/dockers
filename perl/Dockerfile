#we cannot install oracle java 8 directly anymore due to oracle license change
FROM gizmotronic/oracle-java

RUN mkdir /scratch 

RUN apt-get update && apt-get install -y apt-utils locales && \
    echo "LC_ALL=en_US.UTF-8" >> /etc/environment && \
    echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && \
    echo "LANG=en_US.UTF-8" > /etc/locale.conf && \
    locale-gen en_US.UTF-8

RUN apt-get install -y \
    apt-transport-https \
    ca-certificates \
    libxml2-dev \
    libcurl4-openssl-dev \
    wget \
    git \
    pandoc \
    libterm-readline-gnu-perl \
    curl \
    libcurl3-dev \
    libssl-dev \
    build-essential

RUN curl -L http://cpanmin.us | perl - Perl::Core;
