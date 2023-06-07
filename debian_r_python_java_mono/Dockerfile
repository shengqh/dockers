FROM python:3.10.11

RUN apt update && apt install -y apt-utils && apt upgrade -y
RUN pip install --upgrade pip

ENV SKLEARN_ALLOW_DEPRECATED_SKLEARN_PACKAGE_INSTALL=True
RUN pip3 install pandas scipy numpy seaborn scikit-learn umap-learn

RUN apt-get install -y \
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
  libcairo2-dev 

RUN apt-get install -y \
  imagemagick \
  wget \
  automake \
  cmake \
  git \
  curl \
  lftp \
  unzip \
  default-jre \
  default-jdk

RUN gpg --keyserver keyserver.ubuntu.com --recv-key '95C0FAF38DB3CCAD0C080A7BDC78B2DDEABC47B7'
RUN gpg --armor --export '95C0FAF38DB3CCAD0C080A7BDC78B2DDEABC47B7' | tee /etc/apt/trusted.gpg.d/cran_debian_key.asc
RUN echo "deb http://cloud.r-project.org/bin/linux/debian bullseye-cran40/" | tee /etc/apt/sources.list.d/r.list
RUN apt update; apt install -y r-base; R --version

RUN rm -rf /usr/local/lib/R/site-library; ln -s /usr/lib/R/site-library /usr/local/lib/R/site-library

ENV NGSPERL_VERSION="20230503"
RUN cd /opt; \
    git clone https://github.com/shengqh/ngsperl.git; \
    bash /opt/ngsperl/install_packages_nosudo.sh
ENV PERL5LIB=/opt/ngsperl/lib:$PERL5LIB

RUN apt-get install -y libgdiplus

#20230503: mono
RUN apt install ca-certificates gnupg && \
    gpg --homedir /tmp --no-default-keyring --keyring /usr/share/keyrings/mono-official-archive-keyring.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
    echo "deb [signed-by=/usr/share/keyrings/mono-official-archive-keyring.gpg] https://download.mono-project.com/repo/ubuntu stable-focal main" | tee /etc/apt/sources.list.d/mono-official-stable.list && \
    apt update && \
    apt install -y mono-devel && \
    mono --version

RUN apt-get install -y libv8-dev libgsl-dev

RUN apt-get install -y software-properties-common
RUN apt-get install -y libpoppler-cpp-dev

RUN R -e "install.packages('BiocManager', force=TRUE, ask=FALSE);library('BiocManager')"
RUN R -e "BiocManager::install('jsonlite', force=TRUE, ask=FALSE);library('jsonlite')"
