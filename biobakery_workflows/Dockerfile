FROM shengqh/cqs_chipseq:20240318

RUN cd /opt && \
    git clone https://github.com/picrust/picrust.git && \
    cd picrust && \
    pip2 install --no-cache-dir . && \
    cd /opt && \
    rm -rf picrust

RUN cd /opt   && \
    git clone https://github.com/biobakery/biobakery_workflows.git && \
    cd biobakery_workflows && \
    pip3 install --no-cache-dir . && \
    cd /opt && \
    rm -rf biobakery_workflows
    
