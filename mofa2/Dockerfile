FROM rocker/r-ver:4.4.1

# ----------------------------
# Install system dependencies
# ----------------------------
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    gfortran \
    curl \
    git \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libgit2-dev \
    libhdf5-dev \
    libfontconfig1-dev \
    libcairo2-dev \
    libfreetype6-dev \
    libpng-dev \
    libtiff5-dev \
    libjpeg-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    libxt-dev \
    software-properties-common \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y wget

# Build Python 3.12 with shared library
RUN wget https://www.python.org/ftp/python/3.12.4/Python-3.12.4.tgz \
 && tar -xzf Python-3.12.4.tgz \
 && cd Python-3.12.4 \
 && ./configure --enable-optimizations --enable-shared \
 && make -j$(nproc) \
 && make altinstall

# Make shared library visible
ENV LD_LIBRARY_PATH=/usr/local/lib

# Create venv
RUN /usr/local/bin/python3.12 -m venv /opt/mofa_env

ENV PATH="/opt/mofa_env/bin:$PATH"

# Upgrade pip
RUN pip install --upgrade pip setuptools wheel

# ----------------------------
# Install mofapy2 (flexible)
# ----------------------------
RUN pip install mofapy2

# (optional pin)
# RUN pip install mofapy2==0.5.7

# ----------------------------
# Tell R to use this Python
# ----------------------------
ENV RETICULATE_PYTHON=/opt/mofa_env/bin/python

# ----------------------------
# Install R dependencies
# ----------------------------
RUN R -e "install.packages('remotes', repos='https://cran.r-project.org')"

RUN R -e "\
install.packages('BiocManager', repos='https://cran.r-project.org'); \
BiocManager::install(c( \
  'reticulate','basilisk','BiocParallel', \
  'rhdf5','HDF5Array','DelayedArray', \
  'dplyr','tidyr','ggplot2','cowplot', \
  'pheatmap','corrplot','foreach','doParallel' \
), ask=FALSE)"

# ----------------------------
# Install MOFA2
# ----------------------------
RUN R -e "BiocManager::install('bioFAM/MOFA2', ask=FALSE)"

# ----------------------------
# Sanity check
# ----------------------------
RUN R -e "\
library(reticulate); \
py_config(); \
library(MOFA2); \
print('MOFA2 ready')"

RUN R -e "BiocManager::install(c('knitr', 'rmarkdown', 'rmdformats', 'psych'), ask=FALSE)"

RUN apt-get install -y pandoc
