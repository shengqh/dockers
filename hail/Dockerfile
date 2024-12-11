FROM hailgenetics/hail:0.2.133-py3.11

# Adding the package path to local
ENV PATH=$PATH:/usr/local/gcloud/google-cloud-sdk/bin

RUN python3 -m pip install --upgrade pip

RUN apt-get update
RUN apt-get install -y wget

# Downloading gcloud package
RUN cd /tmp; wget https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz

# Installing the package
RUN mkdir -p /usr/local/gcloud \
  && tar -C /usr/local/gcloud -xvf /tmp/google-cloud-sdk.tar.gz \
  && /usr/local/gcloud/google-cloud-sdk/install.sh

RUN apt-get install -y apt-utils 
RUN apt-get install -y lbzip2 bzip2 autoconf build-essential libz-dev libbz2-dev liblzma-dev libcurl4-openssl-dev mlocate
RUN updatedb

ARG BCFTOOLS_VERSION="1.21"
RUN cd /opt; \
    wget https://github.com/samtools/bcftools/releases/download/${BCFTOOLS_VERSION}/bcftools-${BCFTOOLS_VERSION}.tar.bz2 ; \
    tar -jxvf bcftools-${BCFTOOLS_VERSION}.tar.bz2 ; \
    cd bcftools-${BCFTOOLS_VERSION} ; \
    ./configure ; \
    make ; \
    make install ; \
    cd .. ; \
    rm -rf bcftools-${BCFTOOLS_VERSION}; \
    bcftools --version

RUN pip3 install fsspec google-cloud-bigquery google-cloud-storage gcsfs db-dtypes pandas_gbq google-cloud-bigquery-storage
