FROM python:3.14.0-bookworm

RUN apt update && apt install -y apt-utils && apt upgrade -y

ENV SKLEARN_ALLOW_DEPRECATED_SKLEARN_PACKAGE_INSTALL=True

RUN pip install --no-cache-dir --upgrade \
  pandas scipy numpy seaborn scikit-learn

RUN apt-get update && \
  apt-get install -y software-properties-common \
  libmagick++-dev \
  libhdf5-dev \
  libcurl4-gnutls-dev \
  librtmp-dev \
  libfontconfig1-dev \
  libxml2-dev \
  libnlopt-dev \
  libfftw3-dev \
  libfftw3-doc \
  libgeos-dev \
  libharfbuzz-dev \
  libfribidi-dev \
  libfreetype6-dev \
  libpng-dev \
  libtiff5-dev \
  libjpeg-dev \ 
  libsqlite3-dev \
  libproj-dev \
  libcairo2-dev \
  imagemagick \
  wget \
  automake \
  cmake \
  git \
  curl \
  lftp \
  unzip \
  default-jre \
  default-jdk \
  libv8-dev \
  libgsl-dev \
  libpoppler-cpp-dev \
  libgdiplus

RUN gpg --keyserver keyserver.ubuntu.com --recv-key '95C0FAF38DB3CCAD0C080A7BDC78B2DDEABC47B7'
RUN gpg --armor --export '95C0FAF38DB3CCAD0C080A7BDC78B2DDEABC47B7' | tee /etc/apt/trusted.gpg.d/cran_debian_key.asc
RUN echo "deb http://cloud.r-project.org/bin/linux/debian bookworm-cran40/" | tee /etc/apt/sources.list.d/r.list
RUN apt-get update; apt-get install -y r-base; R --version

RUN rm -rf /usr/local/lib/R/site-library; ln -s /usr/lib/R/site-library /usr/local/lib/R/site-library

RUN apt-get install -y ca-certificates gnupg && \
    gpg --homedir /tmp --no-default-keyring --keyring /usr/share/keyrings/mono-official-archive-keyring.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
    echo "deb [signed-by=/usr/share/keyrings/mono-official-archive-keyring.gpg] https://download.mono-project.com/repo/ubuntu stable-focal main" | tee /etc/apt/sources.list.d/mono-official-stable.list && \
    apt-get update && \
    apt-get install -y mono-devel && \
    mono --version

RUN R -e "install.packages('BiocManager', force=TRUE, ask=FALSE);library('BiocManager')" && \
  R -e "BiocManager::install('jsonlite', force=TRUE, ask=FALSE);library('jsonlite')" && \
  R -e "BiocManager::install('languageserver', force=TRUE, ask=FALSE);library('languageserver')" && \
  R -e "BiocManager::install(ask=FALSE)"

ENV NGSPERL_VERSION="20250903"
RUN cd /opt; \
    git clone https://github.com/shengqh/ngsperl.git; \
    bash /opt/ngsperl/install_packages_nosudo.sh
ENV PERL5LIB=/opt/ngsperl/lib

#umap-learn will cause conflict, remove it from root image
#RUN pip install --no-cache-dir --upgrade umap-learn
