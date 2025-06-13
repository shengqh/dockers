FROM python:3.9.23-slim

RUN python3 -m pip install --upgrade pip
RUN pip3 install scipy h5py

RUN apt-get update
RUN apt-get install -y wget git

RUN cd /opt; git clone https://github.com/shengqh/PRScs.git
RUN python3 /opt/PRScs/PRScs.py --help