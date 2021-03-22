FROM shengqh/bioinfo:base

RUN apt-get update  

RUN pip install numpy scipy

RUN mkdir /mageck
WORKDIR /mageck
RUN git clone https://bitbucket.org/liulab/mageck.git
WORKDIR /mageck/mageck
RUN python3 setup.py install

RUN mageck --version

RUN R -e "install.packages('BiocManager',repos = 'http://cran.us.r-project.org')"
RUN R -e "BiocManager::install('knitr', ask=F)"
RUN R -e "BiocManager::install('pheatmap', ask=F)"
RUN R -e "BiocManager::install('xtable', ask=F);library(xtable);"

RUN apt-get install -y texinfo
RUN apt-get install -y texlive
RUN apt-get install -y texlive-latex-extra

RUN R -e "BiocManager::install('ggplot2', ask=F);library(ggplot2);"
RUN R -e "BiocManager::install('gplots', ask=F);library(gplots);"

