FROM shengqh/bioinfo:java1.8.0_perl5.22.1_r3.6.1_python2.7.12

RUN add-apt-repository ppa:bradner-computation/pipeline
RUN apt-get update
RUN apt-get install -y bamliquidator

RUN pip install git+https://github.com/linlabbcm/bamplot.git
RUN bamplot --help

RUN mkdir /gpfs52 /gpfs23