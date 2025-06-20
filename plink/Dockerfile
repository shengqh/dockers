FROM hkim298/plink_1.9_2.0:20230116_20230707

RUN apt-get update
RUN apt-get install -y python3
RUN apt-get install -y python3-pip
RUN pip3 install pandas

# install plink2
RUN cd opt; \
    wget https://s3.amazonaws.com/plink2-assets/alpha6/plink2_linux_x86_64_20250129.zip; \
    unzip plink2_linux_x86_64_20250129.zip; \
    rm plink2_linux_x86_64_20250129.zip; \
    chmod +x plink2; \
    mv plink2 /usr/local/bin/plink2; \
    plink2 --version

RUN pip3 install pgenlib
