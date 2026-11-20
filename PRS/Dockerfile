FROM python:3.9.23-slim

RUN python3 -m pip install --upgrade pip
RUN pip3 install scipy h5py

RUN apt-get update
RUN apt-get install -y wget git

ENV PRScs_VERSION="v20241121"
RUN cd /opt; git clone https://github.com/getian107/PRScs.git
RUN python3 /opt/PRScs/PRScs.py --help
