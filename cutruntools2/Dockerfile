FROM litd/docker-cutruntools:v202201

RUN cd /opt/CUT-RUNTools-2.0/ && git reset --hard && git pull && chmod 755 *.sh */*.sh */*/*.sh

RUN rm -f /opt/conda/envs/app/bin/R /opt/conda/envs/app/bin/Rscript

RUN apt-get update --fix-missing && \
    apt-get -y remove r-base && \
    apt-get -y install --no-install-recommends software-properties-common dirmngr gpg-agent r-base && \
    apt-get -y install curl make gcc g++ cmake gfortran libcurl4-openssl-dev libreadline-dev libz-dev libbz2-dev liblzma-dev libpcre3-dev libssl-dev libopenblas-dev default-jre unzip libboost-all-dev libpng-dev libcairo2-dev tabix libxml2-dev && \
    /usr/bin/Rscript /opt/CUT-RUNTools-2.0/install/r-pkgs-install.r

RUN R -e ".libPaths()"

RUN apt-get install -y ghostscript

RUN cd /opt && git clone https://github.com/FredHutch/SEACR.git

