FROM python:3.7

RUN pip install --upgrade pip
RUN pip install scikit-learn numba==0.50 pandas numpy==1.18 loompy

RUN cd /opt; \
    git clone https://github.com/simslab/scHPF.git; \
    cd scHPF; \
    pip install .

RUN scHPF --help


