FROM shengqh/bioinfo:java1.8.0_perl5.22.1_r3.6.1_python3.7.3
MAINTAINER Viktor Petukhov "viktor.s.petuhov@ya.ru" Quanhu Sheng "shengqh@gmail.com"

RUN apt update && apt install -y cmake

RUN \
  cd /opt && \
  wget https://github.com/jgm/pandoc/releases/download/2.1.3/pandoc-2.1.3-linux.tar.gz && \
  tar xvzf pandoc-2.1.3-linux.tar.gz --strip-components 1 -C /usr/local/ && \
  git clone git://github.com/pezmaster31/bamtools.git && \
  mkdir bamtools/build && \
  cd bamtools/build && \
  cmake .. && make && make install

RUN \
  cd /opt && \
  wget http://sourceforge.net/projects/boost/files/boost/1.60.0/boost_1_60_0.tar.gz && \
  tar -xvzf boost_1_60_0.tar.gz && \
  cd boost_1_60_0 && \
  ./bootstrap.sh --with-libraries=filesystem,iostreams,log,system,thread,test && \
  ./b2 cxxflags=-std=c++11 link=shared threading=multi install --prefix=/usr/local

RUN \
  R -e 'chooseCRANmirror(ind=52); install.packages(c("devtools", "RcppProgress", "Rcpp","RcppEigen", "RInside", "Matrix", "optparse", "rmarkdown"))' && \
  R -e 'devtools::install_github("hms-dbmi/dropEst/dropestr/", dependencies=T)' && \
  R -e 'chooseCRANmirror(ind=52); install.packages("ks", dependencies=c("Depends", "Imports", "LinkingTo"))'

RUN \
  cd /opt && \
  git clone https://github.com/hms-dbmi/dropEst.git && \  
  mkdir dropEst/build && \
  cd dropEst/build && \
  cmake -D BOOST_ROOT=/usr/local/ .. && \
  make

ENV PATH=/opt/dropEst/build:$PATH

RUN dropest -h
