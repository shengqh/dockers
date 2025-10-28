FROM python:3.10.19-bookworm

RUN apt-get update

RUN git clone https://github.com/chengarthur/Vireobulk_analysis.git && \
  cd Vireobulk_analysis/ && \
  pip install -r requirements.txt && \
  cd .. && \
  rm -rf Vireobulk_analysis && \
  vireo --help


