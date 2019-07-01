FROM shengqh/bioinfo:cqs-rnaseq

RUN curl -L http://cpanmin.us | perl - Hash::Merge;

ADD https://api.github.com/repos/shengqh/cqsperl/git/refs/heads/master version.json
RUN cd /opt && git clone -bmaster https://github.com/shengqh/cqsperl.git
ENV PERL5LIB=/opt/cqsperl/lib:$PERL5LIB

RUN echo $PERL5LIB

RUN curl -L http://cpanmin.us | perl - String::Util;
