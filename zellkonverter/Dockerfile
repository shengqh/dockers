# https://github.com/royfrancis/docker-zellkonverter/blob/main/Dockerfile
# CONVERT H5AD TO SCE
# 2022 Roy Francis
# on r-4.5.1, installs miniconda, creates zell conda env

FROM r-base:4.5.1

RUN apt-get update \
   && apt-get install --no-install-recommends -y build-essential \
   && apt-get clean \
   && rm -rf /var/lib/apt/lists/* \
   && mkdir /zell \
   && mkdir /zell/scripts /zell/work

COPY env.yml /zell/scripts/

ENV CONDA_DIR=$HOME/miniconda3
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh \
  && /bin/bash ~/miniconda.sh -b -p $CONDA_DIR \
  && rm ~/miniconda.sh
ENV PATH=$CONDA_DIR/bin:$PATH

RUN conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/main
RUN conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/r
RUN conda install mamba -n base -c conda-forge
RUN mamba env create -f /zell/scripts/env.yml
RUN mamba activate zell
RUN R -e "install.packages('Seurat');library(Seurat);"
RUN R -e "remotes::install_github('mojaveazure/seurat-disk');library(SeuratDisk);"
WORKDIR /zell/work
#CMD conda run -n zell Rscript /zell/scripts/convert.R