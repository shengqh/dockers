FROM python:3.13.9-bookworm

# Alot of packages are not compatible with python 3.14 yet, so we use python 3.13 for now

RUN apt update && apt install -y apt-utils && apt upgrade -y

# set locale, without this, R code may not handle unicode character correctly
RUN apt-get update && \
  apt-get install -y locales && \
  sed -i 's/^# *en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
  locale-gen && \
  update-locale LANG=en_US.UTF-8 LC_CTYPE=en_US.UTF-8

ENV LANG=en_US.UTF-8 \
  LC_CTYPE=en_US.UTF-8 \
  SKLEARN_ALLOW_DEPRECATED_SKLEARN_PACKAGE_INSTALL=True

RUN apt-get update && apt-get install -y \
  software-properties-common \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg \
  lsb-release \
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
  lftp \
  unzip \
  default-jre \
  default-jdk \
  libv8-dev \
  libgsl-dev \
  libpoppler-cpp-dev \
  libgdiplus \
  && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir --upgrade \
  pandas scipy numpy seaborn scikit-learn

RUN gpg --keyserver keyserver.ubuntu.com --recv-key '95C0FAF38DB3CCAD0C080A7BDC78B2DDEABC47B7' && \
  gpg --armor --export '95C0FAF38DB3CCAD0C080A7BDC78B2DDEABC47B7' | tee /etc/apt/trusted.gpg.d/cran_debian_key.asc && \
  echo "deb http://cloud.r-project.org/bin/linux/debian bookworm-cran40/" | tee /etc/apt/sources.list.d/r.list && \
  apt-get update && apt-get install -y r-base

RUN rm -rf /usr/local/lib/R/site-library && ln -s /usr/lib/R/site-library /usr/local/lib/R/site-library

RUN gpg --homedir /tmp --no-default-keyring --keyring /usr/share/keyrings/mono-official-archive-keyring.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
  echo "deb [signed-by=/usr/share/keyrings/mono-official-archive-keyring.gpg] https://download.mono-project.com/repo/ubuntu stable-focal main" | tee /etc/apt/sources.list.d/mono-official-stable.list && \
  apt-get update && \
  apt-get install -y mono-devel

RUN R -e "install.packages('BiocManager', force=TRUE, ask=FALSE);library('BiocManager')" && \
  R -e "BiocManager::install('jsonlite', force=TRUE, ask=FALSE);library('jsonlite')" && \
  R -e "BiocManager::install('languageserver', force=TRUE, ask=FALSE);library('languageserver')" && \
  R -e "BiocManager::install(ask=FALSE)"

ENV NGSPERL_VERSION="202501014" \
  PERL5LIB=/opt/ngsperl/lib

RUN cd /opt && \
  git clone https://github.com/shengqh/ngsperl.git && \
  bash /opt/ngsperl/install_packages_nosudo.sh
