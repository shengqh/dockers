FROM shengqh/bioinfo:base

ARG STAR_VERSION="2.7.1a"
RUN cd /opt; \
    wget https://github.com/alexdobin/STAR/archive/${STAR_VERSION}.tar.gz; \
    tar -xzf ${STAR_VERSION}.tar.gz; \
    cd STAR-${STAR_VERSION}/source; \
    make STAR; \
    cp STAR /usr/local/bin; \
    cd ../..; \
    rm -rf STAR-${STAR_VERSION} ${STAR_VERSION}.tar.gz

RUN STAR --version

ARG SUBREAD_VERSION="1.6.4"
RUN cd /opt; \
    wget -O subread-${SUBREAD_VERSION}-Linux-x86_64.tar.gz https://sourceforge.net/projects/subread/files/subread-${SUBREAD_VERSION}/subread-${SUBREAD_VERSION}-Linux-x86_64.tar.gz/download; \
    tar -xzvf subread-${SUBREAD_VERSION}-Linux-x86_64.tar.gz; \
    rm subread-${SUBREAD_VERSION}-Linux-x86_64.tar.gz;
ENV PATH=$PATH:/opt/subread-${SUBREAD_VERSION}-Linux-x86_64/bin

RUN featureCounts -v

RUN R -e "library(devtools); install_github(\"shengqh/WebGestaltR\")"

ADD https://api.github.com/repos/shengqh/ngsperl/git/refs/heads/master version.json
RUN cd /opt && git clone -bmaster https://github.com/shengqh/ngsperl.git
ENV PERL5LIB=/opt/ngsperl/lib:$PERL5LIB

RUN echo $PERL5LIB

