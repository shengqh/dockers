FROM shengqh/bioinfo:base

RUN apt-get update
RUN apt-get install -y tabix

RUn tabix --version

RUN cd /usr/local/bin && wget https://raw.githubusercontent.com/shengqh/agd_vcf/refs/heads/main/agd_vcf && chmod +x agd_vcf

