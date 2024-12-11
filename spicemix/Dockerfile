FROM continuumio/miniconda3:latest
 
ADD SpiceMix.yml /src/SpiceMix.yml
 
RUN conda env create -f /src/SpiceMix.yml
ENV PATH=/opt/conda/envs/SpiceMix/bin:$PATH
RUN /bin/bash -c "source activate SpiceMix"

