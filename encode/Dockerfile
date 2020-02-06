FROM shengqh/cqs_chipseq

RUN pip3 install --upgrade pip
RUN pip3 install --upgrade numpy SAMstats pandas caper macs2

RUN cd /opt; git clone https://github.com/ENCODE-DCC/chip-seq-pipeline2.git
ENV PATH=/opt/chip-seq-pipeline2/src:$PATH

